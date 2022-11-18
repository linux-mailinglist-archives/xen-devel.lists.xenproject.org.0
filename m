Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FEB62F746
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 15:27:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445811.701217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow2KV-0003c9-Fo; Fri, 18 Nov 2022 14:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445811.701217; Fri, 18 Nov 2022 14:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow2KV-0003Zc-CK; Fri, 18 Nov 2022 14:26:55 +0000
Received: by outflank-mailman (input) for mailman id 445811;
 Fri, 18 Nov 2022 14:26:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pmcl=3S=citrix.com=prvs=31449dec1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ow2KT-0003ZW-I3
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 14:26:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a888508-674d-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 15:26:51 +0100 (CET)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Nov 2022 09:26:49 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6419.namprd03.prod.outlook.com (2603:10b6:806:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Fri, 18 Nov
 2022 14:26:47 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Fri, 18 Nov 2022
 14:26:47 +0000
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
X-Inumbo-ID: 0a888508-674d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668781611;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AyhkqLleMRx0SzMNTZlrN7J9sB33TBgsH4vEMo82oNs=;
  b=PsULl2l89JljIiV3K3D3MyS7YXyjlKQBeVP99jPrDBohBaliuDFCIIBZ
   pAYSSFUKd7PdyFeitZOth2MuvMat3vS4EbNW7034XBW3EsPRG97lFIL39
   iEzHNv6KwGT2Jb6vOavTZH9AfxcgKbWhzmlhFgSULK85eAuo/3+z6YHAz
   Q=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 85136771
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Nm0vzq6ikDKTJOyBW4/rtwxRtA3GchMFZxGqfqrLsTDasY5as4F+v
 jRNUDqEOffZZzH9Lt12OovjoBhUvpSGztNrGVdrqHwwHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkS7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mp
 OUeKjAIaEq6pryH/uOAF9hopN85M5y+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+eF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efwHqgBt1NTdVU8NZSslzP2kwKNycyUHKEjdyHoXfuSeN2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaETAcMGsqdSICCwwf7LHeTJobixvOSpNoF/ezh9isQDXom
 WnV8245mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 xDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:lpfp+q+FM0qpLkfQT/Buk+Gydr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 2hz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajTQ8aCwUh4AyuiyrtzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GKN2QhtMTIjDMjB/tQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1ImjvsV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8YD4hEcJOia9QbxOcsiMbzZhB+Z
 MO+1jcm4tcDBvGkii4z9/UVytynk7xhXY5i+Ycg1FWTINbQr5Mqo40+l9TDf47bVTHwbFiNN
 MrINDX5f5Qf1/fR3fFvlN3yNjpZXg3FgfueDlxhuWllxxt2FxpxUoRw8IS2l0a8ogmdpVC7+
 PYdox1ibBnVKYtHO1ALdZEZfHyJn3GQBrKPm7XC0/gDrs7N3XErIOyyKkp5dutZIcDwPIJ6d
 j8uWtjxC8Pkn/VeI2zNMUhyGGPfIz9Z0Wh9ihm3ek2hlWmL4CbcxFqSzgV4ridSrskc4jmss
 2ISeNr6s/YXBTT8LlyrnPDsrlpWAwjuZ4uy6IGcmPLhP73AavXkcGeWMrvBdPWYEYZsyXEcz
 E+YAQ=
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="85136771"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oG1ho8aRy4VPFRB5/0Luo6BemPtnSWyNIzgU1NisiMqNfEauimdeLegfL8izV1FEqdvUxSc0oai1JyTmu3/5M5Yf/7h06+hHlYOCkxK18kXeQkm6a/KbzVGGLXTQOFSOYRrIBuB5uruFrXq8AS3fghSNLx3SMCBua7mb+64mIDB7grhHIneJoyJqqW8OAnYgBcoUb5FEx5JbF91CK2GzcpGaVhfwAsVRmIhGiSqHGXiTnI+4wPXibJiQoneyRQuwZNzuhh1DlHruxLBFUQYMYBZUeEupXhgaiKLfjZE+73IgO7VHpENwRCCuD6ws0yG/Ymn52u0AyUnZP1ILTXeB6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdHW+CD+LvS3lDFBvGGEz4K2719YLrRZKumvuHvW+YQ=;
 b=kdbtzcjPWCa1zn1v8KaxrlArQ/5gkfkLwZob8IRe4pGcXPx2dqi/VTOL9KPw5VTRANI9OWzGty1aiGvC5pDI/2Q+icIT4hICvWVO8vYByvk+M+v/nCHtctvBCo8Z8vTEsSEBbytb/hV0gW41tX1txlsafw/TUg+VObNU36iD8IEuBV1C5sDow35QjP/1/cqExgyYVUmN6UXMQpuLqsYJf+CQV9Y5JJfBMjW2Cmt7dTjNMtOeM+2WqL2yqw7pmcNrxA9s1kwHtSK/mHCItR2BxWOYQwlEKAt3OIbqNJ6hBBO2pz879ZQqhdw/BQH9aBrA2yY59JpOdCRxdI9+v6vYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdHW+CD+LvS3lDFBvGGEz4K2719YLrRZKumvuHvW+YQ=;
 b=kTPhsisBF4u9qcGo42V/fWGX/ZxO/jxdg4S0TJlz9DGrpxTVCqKDM+d0DleUnI8Odwfsu7oQdL3t0VyW4J2U0PN83RzP+9WBG8clxHdA3hOR4tBq7qMxkr747bWN1vMrkafDJE6TFIQw0PWk94mOEqtr6AvlE0utnla5KZFjRJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 18 Nov 2022 15:26:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Message-ID: <Y3eWISfCCW/ktjB+@Air-de-Roger>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
X-ClientProxiedBy: LO4P123CA0584.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: febaf5b6-e4a9-466f-0db2-08dac970ec9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qDFzUXbPDoc7RYlHyn7MaOcZn8IZhaDIjNJwbpNQJCKVRZv1IPYlOQ5K4DQX33bUXexXnSM1pFDsnmzHRP+xr0BkUQF5LwjZ0A5UsOm1auvvmDmE6jHoG4VxsQoOOafQw0QenCYvBc1QGjinoLSlXGRsAlhGoU7k2DrTBdLifXcavU7b4PRd+KbmatLjbKz/dVBFrzZpGvm8CFzij4CAQLZvEYBDwJgvCJ+wpqhLBNtkTKu//xpPr0y4hVuPbQaQ/hjlghtJD6aIfr84hUn4XDuJ6WmAMmWFxUF96AjFg6GqcI9DDDckFzvcPGtNN0pRRC0pDCDqcfJtR2PfUs+egjS/U98yUZ8hlJlwMl5FhyfUw1v8ILo5/8UGcqsBZUS4GG8AwzrDfGDHRo8VYXcwR4VCJLCptVXa8QPhCMJdamkl9CL/QRCk46zdMuVz9j/f0VIg04zXl0tLJwsLwKde4qz057kM6CghMMyLGlOhxGyEk2XYW5FjLBpqsFnPfBXn7vfb3DBhuS0vAF1pqCLDMhhuTtiJeIhhyB9MQqKY2/hTZFJlJp6BdZeuWpkRwx/tY3oqo+seRgs5JsuT1QRtVKcIdGlqTG1uQ6mF5T2lnk48ilb5FUrUuIFnajKg4uhaLyEBOOpzSItShdTGwTelSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(6506007)(186003)(26005)(9686003)(6512007)(6666004)(86362001)(85182001)(41300700001)(66556008)(66946007)(8676002)(66476007)(83380400001)(6486002)(33716001)(4326008)(478600001)(6916009)(54906003)(82960400001)(316002)(38100700002)(2906002)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QURGanBKU3FRekErMkozNkpiVU5jTUlEMFVQdnc5d2srZ0VJbldTZDhKSXlr?=
 =?utf-8?B?cHJHVitMYk5vWmxtd1pUL2NBY2NzaG0rR25VTVJpbSswMjQ1Z3FZUGt4dCsy?=
 =?utf-8?B?dFFPdlByN3cyeGo4dXd0VU1WRUxkaXhCMEZ1WVJseEF5VXlQWG1BZld4Z2tV?=
 =?utf-8?B?ckhRVExJSWx3VElyaUxHNEZ0NWluU05aRTM3aVZOV0ZqVHQ2dGo3ZXU4SzBh?=
 =?utf-8?B?R1FUSG5nNXhMZFgrR2Q4Wk1yT01BTVU2RjFYbE50dDlTdlJGeGE4eWduS01D?=
 =?utf-8?B?RXlZSFhxVHRldk1ua09YMWxVZ3pJNnFhNWtPL2VvZXowZnZIZXBhc3JmOXpw?=
 =?utf-8?B?RmxybVJVVGRsUzVLcXAwMzRkWm5HeG9nYWJaaTl1ZS9DZ2lqNkhrSFVxRGdK?=
 =?utf-8?B?Y1k4MURiVmliUG9SQUFmMFRCUzNtdXp2UURUN25BNkJ5VzdXTHpLVmxIeUMv?=
 =?utf-8?B?S2phUVVOeW1KUHB2YUREemJEVnhPRUhOdTdmcWNVZnFYdGZhbWx0WWNEd2dy?=
 =?utf-8?B?QytoejlvVGdDZmxvM3JoeU1mNDd2bzMzS1dMOUdYbTlNZFhBb0lNc3h1M28y?=
 =?utf-8?B?bFpmQlFHQllGSDNLK0pWT1ZGaUZIUVdUcjhycWprNVZXdUdyK3RRWHpJb3gr?=
 =?utf-8?B?VVQwUEltcnE4eUdiS1Y4S01nTkZYbnBvNkFPQ3c0T3RwZjlBMURRWXpWMDhG?=
 =?utf-8?B?QSs3L2NHWVovL3U3UkpUeHhKUzlJVXZhUnB4ajZTSlFVa2VaamhLVXo4Mm5Q?=
 =?utf-8?B?RXBjdEZ5UldoTkNjdU1ubHNJbUV5bEJvSU52dnFCaE9CQStIQVRCbnM4aVFx?=
 =?utf-8?B?eVl0TlUwV2ptMmV5eTZ5YXJuTmFwTFY5NjI5M2pTWmsrdHVoVlVKS3pxZkx3?=
 =?utf-8?B?NHdNQjJILzhjQllQYkJ0UHVHNElOMm04aGJ0K3JtOTI4VnZSTDlvOEdDdjBR?=
 =?utf-8?B?amFHaWJjelRpemg3T1lCL0RabDVwTEczeVoxaFJBZVhwRTlsU3gwajZ6cE1h?=
 =?utf-8?B?VDVQMnlOOHJtSHAvTytmRkliVVlWQTZ4WEFzQWZUdEF0eU0zZ3Njelg3Z3hH?=
 =?utf-8?B?QWs0WWlCYXFKdWRCMzcySjBIb1lUaTB2dGdXVkNzRURRQTg1WXhxaTRjSmho?=
 =?utf-8?B?MnlwMlNna1BKSEkrQTVReVJ3V3h3ZjR3bC9FbzZ2T2JnMklvZ2hDK2lVMTAz?=
 =?utf-8?B?b3hNSU1ZaHFCOWNCUGxtU0p2N21qc2kwUVE4amZBbExXUFhXY3gzVEhmUTZp?=
 =?utf-8?B?eVpYV0xNRllsMGIrUlQ5NDgrQUROMlArUVR4TjdSWlJPNnltVnBya0d1QSth?=
 =?utf-8?B?bFlCVmNCeE5taDdkWG8vM1BOaHhycHp0OFpOK21lS0loZU1PaU9hdnpPUXpN?=
 =?utf-8?B?NGErdlp6eUUvM0xMNTNIVGk0QThzZ0t3Sk51Z2JhRlVTVE5CMHBId1E1aytY?=
 =?utf-8?B?Y1NieGQ5cnJhM0s3RitTSHh4dld4dElMRGM3bVRkcHIyNjdTQmJhL0tKTkRt?=
 =?utf-8?B?cGxSL3JQSVVyenJteWZFNitlOG5raWtOQWNPbW1WS25KbHlZS2wyQ1cvVWRZ?=
 =?utf-8?B?MFJlUFR1MHM5K3NueENLdFBod25KaTByNjlMcndPTk5KU0NKQmgxVjlkVUpE?=
 =?utf-8?B?SXpRYzNUSTVaWjdkMTZuV3RlekRiZlJRS0pyc0ZQb2VMcys4c2QzK1duSVFw?=
 =?utf-8?B?a0pQaWNURTRMNG9GYjVEK0pXdEhwWlVIZ3AwUURDYy9SbTh0QXpXcStRMHhQ?=
 =?utf-8?B?VGMrdy8xcld6V2haUzh2TnZ4czZzeVQ3bzBmZ0pPck1RQ09sV3JCclZhMFll?=
 =?utf-8?B?RCtVNGN4RHcycTJoVm5rcEZiWkwwSlhuY1VaNThNbHN1cWpNSm9PeldLWVJK?=
 =?utf-8?B?M05pbUdCTXNqZHZUaWNTMzFIaklQeXJ1cWJSUWtXNXQwOUhWSmRCWUMxNUJ4?=
 =?utf-8?B?dG1XbFkrZXlBczJ6dlVrRG9KV01GUDlSSCtMYzZGUmdyOVg4UDJYQThSSHhr?=
 =?utf-8?B?d245ZEhzdEc1MGlXU3ptN0tSRzVUNkRSNkRhdWdGN2ZjM1JXYmQzYzF2OWhZ?=
 =?utf-8?B?YkR1NnpycHlTMXMrYjM1L0VBanNlcFFQMFFlci8zSEY2d2tJTnBkRHF6Nng1?=
 =?utf-8?Q?PeSZq1ORjwAa5EkfLVnmf7v3J?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N4zgIlRkXb/9Ou2yt2X0WID8OaTsJAzJcG0YD+9jj0w2HO03utaBcUmJsuynwr/mC4BcMCCKGEB11o7CvQXCSgXpahXxe3nUIlCDZpW2tBIYkCBEq/4/tW230+n+ZrNyYhcgHmEiyZ9wQMdiFgqqkTcxfb65Qm521m6rX5sKxsPJbuUDVFICJHM4G5FsS2seTaheG1wgX7CDnSJHpd29MeZmboDZaTTmgUF9IB/O7GZCRR4fwAip6DgwKkLc0jjercLLLuEr8mXNKNVvB8xIZSmRB06DpnPxUJ/ie9FXuPGJTcKSk1LIzYfkNDzp3PndsjqjzD3YtMN+pvkDCCFt7ZQLXff9z56wdwbHMBVtTEDJ5XqclhtmILn61U5oaGnQpRtqkeSo5UdyevZmXz0z2xN3CT3DezU3EVoFvXQ7iK66dUyPmHT/Av6zqPXjAWRzansRgUwYLrvIE3W8j0bejVTeTR/OJHuJ6+JGMMpbBJwf8OAKBMbAyFSI0hS+twnMmCLpnfancbS9Ne64GmzhMV0jLDe71ncs/6Oq8TfqT0Aqp2dJqcVKLFWK7vTO4yyaFmwbhpYAVdOL1LsVFsYv4qNOrvNqXG4+EanlpSLLkPj9KrgnZ2FON+OGkBsS8m8iHuNPTHlAxNzUmCSS4vlsiyeOHb5GAfVL7o8KUd3jbZ/IoFDZOWdnW/bPdm9k53kry5vTEFTlfQKemjg32vqSv9/L5xAG/tch/dj/+coYRuZZQZrt15+VeAjkJpCl5UnNyMguDMjN2PcX9Ao4SjOi3OmO2j9Mxux9ABjVj2RF1BbqsvaKVZcwHk53DaPkdTLApxkTEdURDTLZhXfJ/scgFZm1Val3XZrfb4WydVDuCNk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: febaf5b6-e4a9-466f-0db2-08dac970ec9f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 14:26:47.2212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WVpFEQkzrN4WS/j1gPK3cBq3KrNXcJPFl8G4UTXkSYk0tVsAnGLvMI5AnfKG76TwZGLZCQlR0eLznbEzAFcOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6419

On Fri, Nov 18, 2022 at 11:31:28AM +0100, Jan Beulich wrote:
> Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
> exposed a problem with the marking of the respective vector as
> pending: For quite some time Linux has been checking whether any stale
> ISR or IRR bits would still be set while preparing the LAPIC for use.
> This check is now triggering on the upcall vector, as the registration,
> at least for APs, happens before the LAPIC is actually enabled.
> 
> In software-disabled state an LAPIC would not accept any interrupt
> requests and hence no IRR bit would newly become set while in this
> state. As a result it is also wrong for us to mark the upcall vector as
> having a pending request when the vLAPIC is in this state.
> 
> To compensate for the "enabled" check added to the assertion logic, add
> logic to (conditionally) mark the upcall vector as having a request
> pending at the time the LAPIC is being software-enabled by the guest.
> 
> Fixes: 7b5b8ca7dffd ("x86/upcall: inject a spurious event after setting upcall vector")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Don't one or both of the Viridian uses of vlapic_set_irq() need similar
> guarding?
> 
> Is it actually necessary for hvmop_set_evtchn_upcall_vector() and
> hvm_set_callback_via() to call hvm_assert_evtchn_irq() when
> evtchn_upcall_pending is false?
> 
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -321,9 +321,10 @@ void hvm_assert_evtchn_irq(struct vcpu *
>  
>      if ( v->arch.hvm.evtchn_upcall_vector != 0 )
>      {
> -        uint8_t vector = v->arch.hvm.evtchn_upcall_vector;
> +        struct vlapic *vlapic = vcpu_vlapic(v);
>  
> -        vlapic_set_irq(vcpu_vlapic(v), vector, 0);
> +        if ( vlapic_enabled(vlapic) )
> +           vlapic_set_irq(vlapic, v->arch.hvm.evtchn_upcall_vector, 0);

Shouldn't the vlapic_enabled() check itself be in vlapic_set_irq()? We
certainly don't want any vectors set until the vlapic is enabled, be
it event channel upcalls or any other sources.

Maybe best to add an ASSERT in vlapic_set_irq() to be sure the lapic is
enabled, as other callers already check this before trying to inject?

Also, and not strictly related to your change, isn't this possibly
racy, as by the time you evaluate the return of vlapic_enabled() it is
already stale, as there's no lock to protect it from changing?

Thanks, Roger.

