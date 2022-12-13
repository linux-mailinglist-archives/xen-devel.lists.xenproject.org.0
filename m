Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2ED64B9D2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460894.718922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58Ch-0000Jl-3T; Tue, 13 Dec 2022 16:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460894.718922; Tue, 13 Dec 2022 16:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58Ch-0000H0-0R; Tue, 13 Dec 2022 16:32:27 +0000
Received: by outflank-mailman (input) for mailman id 460894;
 Tue, 13 Dec 2022 16:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeL=4L=citrix.com=prvs=339e21e18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1p58Cf-0008Sb-Bb
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:32:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7d50a4c-7b03-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 17:32:23 +0100 (CET)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Dec 2022 11:32:20 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO3PR03MB6791.namprd03.prod.outlook.com (2603:10b6:303:175::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 16:32:14 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 16:32:14 +0000
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
X-Inumbo-ID: b7d50a4c-7b03-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670949143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=sJ93Kqcs+vf82vQOcu7gbTEFhxiM3Uy2ge4FFxcQ4GQ=;
  b=dOrrVZq0xko4JLK2F7MmLglkrbvqIbLKJuSGN0SbaNSNnhUraS3mKTUf
   omxyT+kZHCAoeX/89vm5wptcszsdmu5EJ081pFQfTfhJG0XuP8suUWpl4
   WYwIM/HdSs8V+jxZsuxVgMypi6wzz2Ul3j1f7rW7Cf2ANNAFfvg1kR2f1
   c=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 88160268
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:B/O6hq79OW+qLs9KRly+pQxRtO3GchMFZxGqfqrLsTDasY5as4F+v
 mVLC2uFP/nbYTbxL9tyOt/l8klVuMTQmtIxHgpu+H8yHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoS5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 O41bzccby6/q8mS26ySCfV9r8E8M5y+VG8fkikIITDxK98DGMmGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0ooj+eF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efzXqlANhMRNVU8NZ6uGDOn3IIUSFMTBjqoNuT1Uq/GNJmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpasEg8sk/RjUo1
 1qAt9LvGTFr9raSTBq19bqKrDX0JSkcK0cDYzMJSU0O5NyLiIM5gw/LT91jOLWoldCzEjb1q
 xiVqAAuirNVitQEv5hX5njCijOo45TMEAg841yOWnr/t1wmIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF9n9hx0xZPpbxt3Qw=
IronPort-HdrOrdr: A9a23:QxDQUK/RPQDfDo9/ODBuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-IronPort-AV: E=Sophos;i="5.96,241,1665460800"; 
   d="scan'208";a="88160268"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huuHqqWJbw/1Gq98HymnQ8vU0U61OEK6OXynt1AS2XOq0X/lfc1fg7R5CBI4kmCY4eDL7racnyhcBexCQ8QEDhyfAff+pDGmgsAHzBZPmORVU3DNb4KPV3skWrpVr3vtiVnvZ2psiZ4zDGwJF325lP5qwTjA1Ok2pUCeWqunkC/TzelLvSzUrKmPIciX+D/FsU42AbbnheEZquPujtqczHh8sTlAsbyCqWR4jzhyT1k+YRVMmhgCxJcC+k9sWoc+yfdiJMEP4sROPKkaPucbRzyI2Rjtx8+1oStyFw5kIzg2L0S8979qsKGM90Ad1vYgpM7yv4Jgi1ChF2m4m8Iaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iXDq00v+qB0BlrrSzP2Ii0oJyOF3yLc5fy3YIt0O2M=;
 b=CaH0BI8X44qCAO6PLWk54PG7TkCstLiKUlhahNFOq/53T59laRx4Hr2TFP91FCw7zjZrb+kmBhPfwBF2IBRG0Cv8H5Zkyl+zB8eENDRdZAnKBvXrShVkjtLgeToz0Hhwvfe3PWPcf3q7pR32bsCiXn+XYC7BG9wGX7Evdo5diNZY/gsXn+ivF05W/T5q3fClTJ+LIyPhm/2eIOkcPn7LHo904HjaJMcVE6qbYOvvPZawb7SnHejTLvuF3fgJ6bCZPXf1CAj8QRmOytvpNwWN3KGxS3MQJBaswyjTzXPStaBr/HiQK5+Hb4MjcvmR7sUedDJjG5UBa6z1FO0+wkNP7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iXDq00v+qB0BlrrSzP2Ii0oJyOF3yLc5fy3YIt0O2M=;
 b=tBFr9CJaSaSlS3o+UI59rvtsN9P4h3ScOvBlGShFFliDSzyRjxnOfZxrXID5Bl9zBGCeZQPKZD8gJ+sXw1a41ghOCjp6y1/QWXRjMbh/RwmQKfuPkeuNdGZTo8KmZoFeHozPJ4DXdcxPNqgO3dR9M4Nyvf9r+E+ocK0rDKixqpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/3] x86/vmx: implement VMExit based guest Bus Lock detection
Date: Tue, 13 Dec 2022 17:31:02 +0100
Message-Id: <20221213163104.19066-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213163104.19066-1-roger.pau@citrix.com>
References: <20221213163104.19066-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0414.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO3PR03MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfd1f5e-a44f-4da9-2e54-08dadd2797a3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PQaYFccMUNJSh64LURevxmH/09jhoW8ca/Hj++ePOsUIS4S2xSxrWUNiGvoj/hUc5pUgp/Fb1imBTWKklj1LXEo5W5PwjSWl0NbSMJVgqJ0dGxENR5tih4TQEaOvyRBjKYGtzMCVteoUVykdU1v2a8eEXQzBT61wo/T+tLX7cximLtnDAEpyWm5miRX4S2h8ItGmsPy0UJ+U94cznvpWAS8IsDwB6kFfrD0bgoSqV9mR+go36eLS8nN9E5whmxv3BJIWIrpNy8q3DUq+yKj6v679BKb2O6JaAmZ5CTbJ/mgu4aSmC5Q2qB1/xc8JSpL+K5hKxF4GiJ6AEVFfJacB8jvAPFHedttONf9NfjfM/QcuQylE3EbPVs7ngqJ050GnzNF98nnC73KPx4PlzEu2btF0LgiCQTL/362COG5lw3z6WEHP//N+ls9m4fIj2Cd9vz8EgyED7OhKEduWnKF7OtGOYVkIc5GfeTqknza8Dpy3n+t+DOGIOCrTHjYGk7LMzeQGyGdoB8u2taR9FOBFeIkz87Xj6plH7M8zxnRzAXMlhvUtPSM+a8l/n0m/jQWD0ikJ+o+DtcyGYo3ynVszZ5E4UgIaV7A/ekvE1U/xJIFPUDP6YopHe7lMGY+4dxHcN55h+SB1vT/8xGZREUXTYDNVWC+EpHtPpoTd8EakuGuAnESUM1fClf3xMRDi3Vui
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(38100700002)(82960400001)(5660300002)(86362001)(478600001)(2906002)(6486002)(41300700001)(6666004)(83380400001)(66946007)(6916009)(6506007)(66476007)(316002)(8936002)(4326008)(54906003)(186003)(6512007)(26005)(1076003)(8676002)(66556008)(2616005)(36756003)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTFjM1dodi9LYURldUlrN1VwVFlRaFNCS1k1OENZRGVYRDNKS0FMdnkrTmRE?=
 =?utf-8?B?MGFBa20vV2NJYW42QkNjbTE5SUNwS2hnRUNtZW9WdXZ5L2RXOGcvMzBEMHR3?=
 =?utf-8?B?NmJldkc2TkVMUFRVZ0phK2NMaHk1TWs1aktGNTQ5NFA3b0k3dzgvbVA2a25S?=
 =?utf-8?B?Q0M5V2gvUGJVOTNkTkpOS3VVSFZnUW5yNXl0WGZrR3phSjhvKzF5YTZPeUpt?=
 =?utf-8?B?ZEViUHpPYUNBUFA0R3FJc0FEcXE0UGFISVQ0dERxN0dGNmJxd05XUHRwdWN4?=
 =?utf-8?B?bHdNNUZOWGF3MmI1QzV0WlMxdnRGVlpDcWZBbkovWUxZL2s3UDBkMVlaaXJo?=
 =?utf-8?B?TWF3VEsxWU1QK1JoRTZwV3NTR0tvNFdZM0E5UUNERW43WUpzUnRNMjF4dTk5?=
 =?utf-8?B?RVJjV3ptVHZmMDVza2JxTkE4akE1bmZyU2hvb2dRYTBPNWlsdldDb1ZmR1dW?=
 =?utf-8?B?MGlGMjVrdTBNVmR6SXhab2dxYmN3Ukl0SVZqaEUrajNmN1ludDRaakh3Z1RO?=
 =?utf-8?B?ZXJsaXVpY2dKOFUyRlEzNk9BdzNBNXlzTDM2VXgxN1o0TmdGTFprOHFvWkJi?=
 =?utf-8?B?MmJyUE1CSmI1YkNLOWZhR2pscFcyVGFnQk4wVi8vVGJiMmRRelo3YldPZEoz?=
 =?utf-8?B?NnQreWE1MEZvUm0wckJYMy9EY1hiaHJ5eUMvZEZyZDh0ZEN0YTBENHNhbVRP?=
 =?utf-8?B?aWhndUxZM2JicHZFT3k3Lzk3THA3MG9TWk5Td0ppRkdQSjFhSnZ1cFFZNDRz?=
 =?utf-8?B?dGI0cisyZk50ZmR4THZLNDVreFBoU1ZQTUMxSHd3eUl5ZTg3Umx4Zjhobm9D?=
 =?utf-8?B?LzlESjdkSi81ckU0WnRlUTJzbXhZN1FyVEMyWngzcFJKRFhObEtFS3FXNlNL?=
 =?utf-8?B?dzd6RXRlaXVEQm0zU2hVQW1aQjh1dzVKWjhBbkpwdWF0V1ZNdXVWQ3hveDVn?=
 =?utf-8?B?WGxDYVNFN2ZGQ3JNenhxN21seC8vUmFXbWU3RHU5bVIydFFQVU03djRzYmFZ?=
 =?utf-8?B?aWJ5VDJNR3lpaGE4a0lEeDZQVUhRcmcvWlBQYlArQllBUXNzSm04QWZNTkpn?=
 =?utf-8?B?ZXNLYVE5d0NMQU40UkQ0SlJiUXl6QlRJZlpFZGpTSlplVHpic0w0L2V6dXRY?=
 =?utf-8?B?NEZ6WnRjRXZrZEJ5WlBpY3gxSVdaSHpYMXR0UWgvbGVKMExCQVc5RGFOc05t?=
 =?utf-8?B?VmlIcEVEd1FicExpTmpLaGI1ei9yRWkzUFFRZTdsbVhTVlZEZkVpV2hheDZL?=
 =?utf-8?B?dmtPTGdSa25KbFVtK2hMMnkyd09iVnd2ai9oY1lRNmJraVM1cjJwU3NrVnl3?=
 =?utf-8?B?R1NNcnBueGwweVowS3FiT3QzNnpETFdiUEc4dmRuQzhNNVNpTW1vUUtIWU5l?=
 =?utf-8?B?MXJRaGNrTW1iVVpOc05ZNDl4YjNXd1BrRnRYZUpmeCtkM3F5ZlZNMjhVYytn?=
 =?utf-8?B?ZzNTOW90djFoYmRtYlFZUTFFN1Q3QU1iRUJZNlVLam1CemloTityVi93VmpD?=
 =?utf-8?B?L3YrVDdxQVNvU0o0c3pLVkppT0FjZWxiaFFlREFYNDdwaUNZQ2MyRDFQTHdr?=
 =?utf-8?B?cTNNYjFZaXI5Z0JMTHdlekFEa2NBdkRxTkVTanhEMjFaMFRabFBjN0QveFl0?=
 =?utf-8?B?L0ZGTmx4RDFyR3RiclZyMzJEM09BRGt5RERXQVRtMUFoRzl6UjRIQ2M0aGRC?=
 =?utf-8?B?RTlEeTkxY2lGMHB1Yy9CZnBGeDVNWDhabzIvSHFvOHBrR3lYSzhpVjA4NjJt?=
 =?utf-8?B?NXZ3MmlaR3NjZTFuYk9uRXdzSXE1VThhZTluM204N1UwSTY2dlM3R3M1eDZ3?=
 =?utf-8?B?c0NEYXpUYWczdlJVQTNmdjIzaUhHZWlPM0NuVXJJMDlIN3RmZm1raG1FOVRQ?=
 =?utf-8?B?ZG5QRWxTcXVDRU0ybGxVR29rd2twSUtTVHZLa0k5TmE4ZFlGZ1BYWXhYVDlY?=
 =?utf-8?B?bW5ZeS94MDVJZ0V5WVJMTmhFQ0xtWExwSzdMK1hiWEwxSHptQ3VJVGI3Q3Zs?=
 =?utf-8?B?VXQ4cyt6WmVVZUlSNW1nRUg2ZmFaVXQzKzZEUm9OL3NPaXpBakd2R0xUWHF3?=
 =?utf-8?B?OTEwNXZsTSs5bFV3dXk4RG9Vdk5zWW9qZFR1Y0FBMTV4UzNUdTdKTjRGamRW?=
 =?utf-8?B?eDJHRkV1cU9XclpXWm5yNmVIODF1RFlDREhweUFCSWNDRGQ1czlyOHlnalRV?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfd1f5e-a44f-4da9-2e54-08dadd2797a3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 16:32:14.6206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEKxYMYLPkcGx5vr+HG3M08d8ax3rQXU66XGeI822BCNJbCSiPSR3sK1PPgevBGRyufa5kxUXHJRSgARy95qpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6791

Add support for enabling guest Bus Lock Detection on Intel systems.
Such detection works by triggering a vmexit, which ought to be enough
of a pause to prevent a guest from abusing of the Bus Lock.

Add an extra Xen perf counter to track the number of Bus Locks detected.
This is done because Bus Locks can also be reported by setting the bit
26 in the exit reason field, so also account for those.

Note EXIT_REASON_BUS_LOCK VMExits will always have bit 26 set in
exit_reason, and hence the performance counter doesn't need to be
increased for EXIT_REASON_BUS_LOCK handling.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Style fixes.
 - Fix usage of exit_reason by nested handlers.

Changes since v2:
 - Subject/commit log adjustments.
 - Simply logic given bit 26 will always be set.

Changes since v1:
 - Adjust commit message.
---
 xen/arch/x86/hvm/vmx/vmcs.c             |  4 +++-
 xen/arch/x86/hvm/vmx/vmx.c              | 15 +++++++++++++++
 xen/arch/x86/hvm/vmx/vvmx.c             |  3 ++-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  3 +++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  2 ++
 xen/arch/x86/include/asm/perfc_defn.h   |  4 +++-
 6 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 84dbb88d33..a0d5e8d6ab 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -209,6 +209,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_virt_exceptions, "Virtualisation Exceptions");
     P(cpu_has_vmx_pml, "Page Modification Logging");
     P(cpu_has_vmx_tsc_scaling, "TSC Scaling");
+    P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
 #undef P
 
     if ( !printed )
@@ -318,7 +319,8 @@ static int vmx_init_vmcs_config(bool bsp)
                SECONDARY_EXEC_ENABLE_VM_FUNCTIONS |
                SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
                SECONDARY_EXEC_XSAVES |
-               SECONDARY_EXEC_TSC_SCALING);
+               SECONDARY_EXEC_TSC_SCALING |
+               SECONDARY_EXEC_BUS_LOCK_DETECTION);
         if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
             opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
         if ( opt_vpid_enabled )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 7c81b80710..3898f92f85 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4081,6 +4081,12 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
             return;
     }
 
+    if ( unlikely(exit_reason & VMX_EXIT_REASONS_BUS_LOCK) )
+    {
+        perfc_incr(buslock);
+        exit_reason &= ~VMX_EXIT_REASONS_BUS_LOCK;
+    }
+
     /* XXX: This looks ugly, but we need a mechanism to ensure
      * any pending vmresume has really happened
      */
@@ -4590,6 +4596,15 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         vmx_handle_descriptor_access(exit_reason);
         break;
 
+    case EXIT_REASON_BUS_LOCK:
+        /*
+         * Nothing to do: just taking a vmexit should be enough of a pause to
+         * prevent a VM from crippling the host with bus locks.  Note
+         * EXIT_REASON_BUS_LOCK will always have bit 26 set in exit_reason, and
+         * hence the perf counter is already increased.
+         */
+        break;
+
     case EXIT_REASON_VMX_PREEMPTION_TIMER_EXPIRED:
     case EXIT_REASON_INVPCID:
     /* fall through */
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 5f54451475..2095c1e612 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2405,7 +2405,7 @@ void nvmx_idtv_handling(void)
      * be reinjected, otherwise, pass to L1.
      */
     __vmread(VM_EXIT_REASON, &reason);
-    if ( reason != EXIT_REASON_EPT_VIOLATION ?
+    if ( (uint16_t)reason != EXIT_REASON_EPT_VIOLATION ?
          !(nvmx->intr.intr_info & INTR_INFO_VALID_MASK) :
          !nvcpu->nv_vmexit_pending )
     {
@@ -2486,6 +2486,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
     case EXIT_REASON_EPT_VIOLATION:
     case EXIT_REASON_EPT_MISCONFIG:
     case EXIT_REASON_EXTERNAL_INTERRUPT:
+    case EXIT_REASON_BUS_LOCK:
         /* pass to L0 handler */
         break;
     case VMX_EXIT_REASONS_FAILED_VMENTRY:
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 75f9928abf..f3df5113d4 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -267,6 +267,7 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS   0x00040000
 #define SECONDARY_EXEC_XSAVES                   0x00100000
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000
+#define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
 extern u32 vmx_secondary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
@@ -346,6 +347,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \
     (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
+#define cpu_has_vmx_bus_lock_detection \
+    (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
 
 #define VMCS_RID_TYPE_MASK              0x80000000
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 8eedf59155..03995701a1 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -159,6 +159,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
  * Exit Reasons
  */
 #define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000
+#define VMX_EXIT_REASONS_BUS_LOCK       (1u << 26)
 
 #define EXIT_REASON_EXCEPTION_NMI       0
 #define EXIT_REASON_EXTERNAL_INTERRUPT  1
@@ -219,6 +220,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define EXIT_REASON_PML_FULL            62
 #define EXIT_REASON_XSAVES              63
 #define EXIT_REASON_XRSTORS             64
+#define EXIT_REASON_BUS_LOCK            74
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index 509afc516b..6fce21e85a 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 65
+#define VMX_PERF_EXIT_REASON_SIZE 75
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
@@ -128,4 +128,6 @@ PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
 PERFCOUNTER(iommu_pt_shatters,    "IOMMU page table shatters")
 PERFCOUNTER(iommu_pt_coalesces,   "IOMMU page table coalesces")
 
+PERFCOUNTER(buslock, "Bus Locks Detected")
+
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */
-- 
2.39.0


