Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C16F722BF7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 17:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543789.849051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6CVF-0000Pf-Ta; Mon, 05 Jun 2023 15:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543789.849051; Mon, 05 Jun 2023 15:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6CVF-0000NK-Qh; Mon, 05 Jun 2023 15:52:17 +0000
Received: by outflank-mailman (input) for mailman id 543789;
 Mon, 05 Jun 2023 15:52:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6CVE-0000NE-B6
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 15:52:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef379dca-03b8-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 17:52:14 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 11:51:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7102.namprd03.prod.outlook.com (2603:10b6:a03:4e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 15:51:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 15:51:29 +0000
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
X-Inumbo-ID: ef379dca-03b8-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685980334;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S/DbWdSXG+jFCjQMU2dCkinxl+jPWXRHL8Z0gyk0b2w=;
  b=IITAp2Qz3omVDUZwyb7YfmlUyTdlVuRZSwGp3/bSQ0gFrtecz/c0bbjH
   XbRrz4v29XujePe+6/MNUBSJt5mERlv2CTlLyJI8Cx1B1FUJHBNeUD4Z6
   cY7bppTwvG3bh4m2vuaDYWBnPq90gqnN7jgY6UHvnDddDOycRMSayQeqv
   4=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 110971168
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vJtTzKCWtEroiRVW//3iw5YqxClBgxIJ4kV8jS/XYbTApDIn0DYBy
 TMbDGHXPf+La2H8etklYN+z9RtQu5+GyNRnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A4gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw08Z3QkZn2
 uAiJwskXiuiueuq8I+eRbw57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDS7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWxXKkAdtMRNVU8NZwoF2Z6DASNSY0amSdpsSl2lXgQuNmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx74j/luYO3qS/uFvA2jSlo8GQShZvv1qLGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWC3zaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:G5noOqEZUhm7lzWdpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-Talos-CUID: 9a23:849gqWNOcC0YB+5DcQlnt2k9NdwffUb0/EzxHUakOVtMR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A2sFiXw79nec+ANKC26tX7Kg5xoxyw6SkJhwMrK4?=
 =?us-ascii?q?khPaiMhFsayzDlQWOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="110971168"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7jHu/UNnDOTbV729lLSARGaFXbTz68UZ5W/izL3ncz9ZmKkogJHSKMy+puAXrdf7EtSRI8qUUVr/lw3shga2lwEA/iic8MISDpWLvQMjrCbTBwofutOAY6Qq91e2+Ub4jL/GkRFqz9BKAiosq1AumNTK9br+Q7BUA2u4DQmmE8P10oLvGHN7kzb0TaxLSMtj6aCwYlhe5Kp22OBsPBRjh/rs1gIzLVusOhWPbCWzi44TSdtJ2AbGmN6NvRnQes6gIGCJ98yTS9BVCqxHG1IGeIx6xli4fgp5/H8S4HyXxuXGd46mZgGTuuU4TescWzeoPb25gwZWMBXKXJyDP8c0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cd34pS2Vcb7Em1RYW0o8JhQKB/mW8n31wq0doLL5p/4=;
 b=RtnA+lkAwGBhuHUHnD63drzz754Ph6KlWlUO233PPZ262f0c4H7mLXP1mqBP1VXMhyHBfCSD24RR4KVqtTYMP3O2Nyl1HiXucJ0tr7MHGvPyKon7e7E75FMGgJXkQRK9RnqApeaoTqLKBkkOBNkxma6TnBxstHNPuWAmTDN0lNGoRFIOOl4WE9wuaOxC69S+WRLAMtLwBobC9oSlYlVBed/569PEgjnleHA/h57dqTCw7Vl2SrGp7yksbVsdlaA8txI5lrHEkdLfMdHquXhxkHZmSrEbgc8Y85FuS0o6/Be1vSGbeAJA6aI1TW6eJLCg04ziVbMaxBtPjFXiZERxuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cd34pS2Vcb7Em1RYW0o8JhQKB/mW8n31wq0doLL5p/4=;
 b=cDYguwMVtAoALc9KuU9HBXbqHXqEls8/YjBq6QGLYgowqG0XlKdzn+0QrX0fYk4XctJ5xyyFoFAHId7oh00Sfh5d4YSriY2VFNqeAkpPGp1+TI/2zVyXtpRWl5xWcicivto9A2HG1bHlSB2KSJAlPaualc7sGItgotbW9RExLno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <144d2685-540c-48df-4d73-ae98c835efa7@citrix.com>
Date: Mon, 5 Jun 2023 16:51:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] amd: disable C6 after 1000 days on Fam17h models 30-3fh
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230605151036.18085-1-roger.pau@citrix.com>
In-Reply-To: <20230605151036.18085-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 05837eb3-5b96-4504-6f32-08db65dcba1f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	99Iu2ZTIRQ5KINwXf0MEGUeWdizpoNzRm/qVY0im2weiWxHNNRoaGL/n/SGvYlLhrLsSPiDAJKq4PhB4sEt75x5hINXRxd7pscKu0rFtLwHHZ3C6GyNTADt1liDZQsFptgL3Mm49X0MSUrdFLiz7v4huXAaRfrqEYIwIqz0djoZjejdQLphNhTuomQN1cnPP0yv3gc8Cxya9j5iR1dSzTc/7rBQcgyN24tXmA8LJShQSkY60HaTfu9vJL46JlwHo1zxRTN2D7dbiuiYd7MRAQCy4SOazbSKYhg8fKe5PSe+ac3NkIvNC5XAiqJFfspqNfW94+89aeSj89wMHVTCZ6lGyxkRqqkz2Ek7gZxlshbO0DBmrJUNxpfkO1PvVWoBGTOXOVmH+n0+10ePlqiXpC7qETjc1kgDmZY63A7CFUxN0frOulTMdluqQO96H7FaFhlJFZX00Lr2dRetNR8ZEwJMpEl2WsJRv11FRUAx2tDk6fisGRR6bw9h/cIx4GQ1vVu8XjCU4bT2+rchyw9ebF/hcbPE+kFLaGbsZ5kCei9to8lg0bpVcq1zHuiEQ5zFM2iwNqFCJPpuq28EsGv1NaAHum1awrtw8TF3a2/BrPWusWaTcMIdleGVqPkNYC0MlO3T/iW+Lc3hvah93d0nCWbT21/np24Ex5DnysxIHs73QwEKx8KRUyQVxAex/gXAi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199021)(53546011)(6512007)(26005)(6506007)(36756003)(83380400001)(31696002)(86362001)(82960400001)(38100700002)(186003)(2616005)(41300700001)(54906003)(2906002)(4744005)(478600001)(66946007)(66476007)(8936002)(8676002)(4326008)(316002)(31686004)(5660300002)(6486002)(66556008)(6666004)(221023011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3dncXFBVWxZdGRESXhPYnlEM29jUXBKUWlOSWpmWStpMGh6enkydnQwcHZ2?=
 =?utf-8?B?QWhtMkN5NmZmUlloa3J0MUtueThJd05Ga3VJSFhNSFo0ZENFQmFWZmhIV09l?=
 =?utf-8?B?VG8wbHJheHZUc0daSDZFMjc1WVhzSGRVT2F5WE5pOEdUK24rakZjSDRyOGNt?=
 =?utf-8?B?RXF3WVRvNWowWk56aC90RGIzVnY2cVdKSEJCaUpYYVRRaURYSG02Z3EwWmhN?=
 =?utf-8?B?Wkg4SjZtVHRuQkd3MW9weDVLWUl1V2c3WWZWK2pjaVpucVdnVkcrNHFXeGRO?=
 =?utf-8?B?NGl0d29FNjhjcjVYNDM1YzlEWk9CbXZOVURpd0pMVzg3ZnJTTVgzLzFsNTZt?=
 =?utf-8?B?VWp4SC9lczFEOFFNc202QmNMNE9QVU90OFd2VDNxeVdaRWd0T3FhWFNZaGRr?=
 =?utf-8?B?dS9QODl5a1IzU0gxKzNlMkEvQUpUNk5PQjdaWFBsNUJrNURna1Y0dDk5RVp1?=
 =?utf-8?B?VWpxNGJRTHkvVGFPSHl3ZnVnNHg4QTVtU1I3Rm54WUNROFpyaHF5MnRETFBN?=
 =?utf-8?B?bmk2b3h5UE9rdDQ3bG40RWlTWEdNeUViZituTFFYM0o4akFjQ2MwTUdZVkIy?=
 =?utf-8?B?QUJQMkgveDlWc0l6VzVYalBRR3gxWEYvZERzL1JreTk0eGlSYkNuOEVXQmxO?=
 =?utf-8?B?RzlqSGo1cDI2dmRsM0lkc05aOHhUU0lGVm1MZlJoakNqeGdvTnF2NVIyNlNJ?=
 =?utf-8?B?N1FPc2I0cVJVaU1yOVRBRHU1aFpYZzlCRlVxWDZUdjdSa2VYRFZEYnBkWktN?=
 =?utf-8?B?VTIrd2tLT25iU2ZFdTJVUEdSRzhwbEhFZjNXQWJJNEowayttMTloWk5XdVFF?=
 =?utf-8?B?eGxsQk56bU42QXpjMjI3dW1RVytvOUpXQ2E4VGJUS3ZJUXBQdEowb2s4UTBE?=
 =?utf-8?B?alRLeHNKSUZsb0l5V1UyREhuTWlnSXg1T2tTZC9weVNZaWwwVmRxM1R1bTUr?=
 =?utf-8?B?Qk9ITmp1clFzVEFELzE3aE8zMTlJL202YmNrcVg2RmNJRGxZeUxPVXNVYUht?=
 =?utf-8?B?OC9nMG5xbFFjQWdtaXg2dm02WDRvZFAyZzd1S1pTNFptcDRLMC9EM1I5VytX?=
 =?utf-8?B?ZFdZUDB3RG1hZWQyejN6NjlUM0NHVzZNenFGUy9mOWpLMmhtdlBCNVNKb2hi?=
 =?utf-8?B?QnhDNWhGUmRNcnIwZld6SU1pL1RROFI4NTIreU5WSjQwV0E4aHcycnZCVHBi?=
 =?utf-8?B?ZU9jT09BeDZrVFNWTFc5MnlXT0o4UlQvdlZoNkp4Z1R6RlZ2RGxSNVc2R1ZX?=
 =?utf-8?B?SDhpZzFYMzJxZzhQYUFQQzRpbkN1NXZBb2ZpTmU4Q0NwQlhWSzg0OXBONnA0?=
 =?utf-8?B?OWlwK2Z2YWZEZXk4VzBjUVNRa0crUFNnZlBaeEhVekdWa3dxKzVaWTEwNzNC?=
 =?utf-8?B?TEt3Q29SQmFGWC9LQ0ZOOGpvYXRtUlYwSDBJTnI2eFNiN1BkeVVVWFBadlYx?=
 =?utf-8?B?QU9pUi9yQlVYSDI2YThCNHlLalF6SS90VUNhR2x3VzZpREpYaFdOQ0h2OEdP?=
 =?utf-8?B?aTFFdzFkUE1hLytxVGZFUTZWU2labHI5YTJkL01YVEVvTlpRVmdPeENMTWVp?=
 =?utf-8?B?Smh3bGtxZk9aNFVtdlhkOThNN2pOTkFBWStobjg4TVhqQW41RWI4cmhXdlZ5?=
 =?utf-8?B?TitYTGgxOUZpVW1BMXJDVnMyQUtGRkZmSGxqamZVSjRNRSs2MUZQM3paMkVG?=
 =?utf-8?B?a25wckVpclU1Q0EwWFVpSzlTQ3oxTXhpd054RGRBUThVS1NxSkVOQVIybEFE?=
 =?utf-8?B?YnErVUNHZkh2UGpGcTFTelRtTlhidGRidmVvaStzOXJleGJIN3ByWGZ5QlpB?=
 =?utf-8?B?UUY3M3VxZCs1NGMxQ1BPQytTRHFhN083N1N0VTNqL0NSUFpRdHpGU0hrbjgv?=
 =?utf-8?B?NTZPeVorbFlUQXVRZm16MUVUVmZZSE1iaFpNbTNXQ3pTSkIwbnpCZ0ZBY05X?=
 =?utf-8?B?eXdVaHhGaTdVejR0Y3lkdmhBWHNlNko2VldISHJ2eDkwYkxwL25jUlg1RUZo?=
 =?utf-8?B?NFVBMDdQS0VhL3hZalE4ODVHcWdSajZ0R2JxMDd2d1VQTDdlVm5ZSHkxd2VZ?=
 =?utf-8?B?cUgvYm1oLzhNUDhsSzJzemViUVhaVVkyQjVQbkowZ2Jnd0RvRnMxdHRkRGFj?=
 =?utf-8?B?V3J1ODFvOUhRRmJhdGJLNDZScDB3Z05UaDdBV2FOTERtOVE4ZCtMcFJhbkFM?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SkSmFdUuu1Trf+wOTIomz4sgMAtWKJsdMOIXvJr0+fVnI1TERXyxkyKuaJSMzouc2+K5UhmP9KZfmz7qGZaTSLBiB/hgO6miLo91AVnNFJT+aWGOXwJxzgXrG3b+8Q3IlFuAku6XFwS0rhfNAdRe1QBlI7V3bTUjOIr1OZUIeN2d2YkfU2q7rYEh7v7ubQZ2VFG5TAO7PP4JH+K87hQkvWqQUVoDbfKuZuC+Xienpv9gydEYZ3KeVVvDrpthQnsOP1ZoyK+nIlL3e7ms1e0XWntD914zvTciYiEy2gRSdw1Gn0rrckLIArOW8no7NBZUQPcJlkvQiBubf7YdJYZ4mrYIQVhjcXg0sc4yjdLsAlIAUccBQ592sE1xJQKhHwtaGGym64ck1HtX2Bb2WOdcmNkRJrBIDEYpf7jaQWVZn/723uo688ANtXSBNBdBJsgWJ5MjrXWyGb9xvAvyomh0c4/lXz83cZtB3oMwMn/baSeFXU8TWi3IVkwe/FDhcvrfdQWHqdhAMuCI+r5evBC7t9m8OriDN7dfVdjdtqKzeb7pNtrPZApcKJJRm0jQuLG8qtFWZZ1tLZIr/1grbDdyLlxoLRyx/ybJJVNjxA5+UgDCu5oAZQKIyfi2Jx+lJnO31VL6h8KfGkMCMC2WSKG20pLVhPkyeSM9bZKtvR3cFMe4Jfj7nlSh4W00G/3VTE7jw7FwIXjAm0I8dpyBYQRHo4yqZ797lqCGGU5yeK4PtAo7nbAJMwm5APvOiKAvt7j0ltMCBAi83ui3QwlK64ot//+PL+fbPEjxhvbMgC1n/sVzL8HqAvK1hkhp2FlWlTOQ2dMBh8w8TtaRNAgnlAemNY1Jp9hBrQ8EM+LGzqv1hMg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05837eb3-5b96-4504-6f32-08db65dcba1f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 15:51:29.7673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a27fOBnbxmuCpkYjGSX+WWSpp5joBgX5HpIhatA92nt8aZle2/7u1MrU9Jj6jRDcsyJT2nKOdhnVla1OBjYWfMQYMUBGG2zpd3vy6RPQUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7102

On 05/06/2023 4:10 pm, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index 0d3143031b5b..728fa61a54bb 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -1189,3 +1190,44 @@ const struct cpu_dev amd_cpu_dev = {
>  	.c_early_init	= early_init_amd,
>  	.c_init		= init_amd,
>  };
> +
> +static void cf_check disable_c6(void *arg)
> +{
> +	printk(XENLOG_WARNING
> +	       "Disabling C6 after 1000 days uptime due to AMD errata 1474\n");
> +	amd_disable_c6 = true;

I don't think this is good enough.

AMD CPUs can enter C6 from HLT and IOCstate as well as via MWAIT. 
You're going to need to modify the MSRs as described in the revision
guide, which will inhibit all ways of entering C6.

~Andrew

