Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738360F8F0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 15:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431050.683548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo2rQ-0002fk-DE; Thu, 27 Oct 2022 13:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431050.683548; Thu, 27 Oct 2022 13:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo2rQ-0002dh-9n; Thu, 27 Oct 2022 13:23:52 +0000
Received: by outflank-mailman (input) for mailman id 431050;
 Thu, 27 Oct 2022 13:23:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/85=24=citrix.com=prvs=2922bd7c1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oo2rO-0002NC-Px
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 13:23:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b19e53f-55fa-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 15:23:28 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Oct 2022 09:23:45 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6377.namprd03.prod.outlook.com (2603:10b6:303:11c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 13:23:43 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 13:23:43 +0000
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
X-Inumbo-ID: 8b19e53f-55fa-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666877029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VYmDNmKt0p2+CEpXe0jIDJH4snfwphrxsB4ACulM+Yo=;
  b=Q0seDADDHnt5xZEDzDodyaju4Rz0vaUkwKQ1NfjEXQ5094elUe19UrDp
   nTtt2d7gCVdxJHHeJUv4ZJzJa/zLPSZKUar3pUXZ49GJEcuow26JqkGtF
   Qy6p8PqVDSJt/WuJd9fxpyZzJCc3cQYb0HKaQrQjUeBEG4trO1ayeAYM0
   A=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 83623812
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MZ69WqrCQjw+OG8nF8Hm9nDpaUReBmIOZBIvgKrLsJaIsI4StFCzt
 garIBmBM/yJMzCkLYgkbIjlp08D75LUmtcwHVBuri4yRn4X+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgR4weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5ms
 sYGAxwpfhq/h/OYwIK8cbVjg98NFZy+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOCF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efxn2hA9JLTtVU8NZXrAfIxGA6KiEvfnmxoPiU1WiZZMBQf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2IB5UlqY/7aQ6DatYy4cKDZaYTdeFFNdpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:1HBjl67Bf+7s+UpEKgPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKnyXcV2/hrAV7GZmXbUQSTXeVfBOfZowEIXheOj9K1tp
 0QDJSWdueAamSS5PySiGfYLz9j+qj+zEnBv5aj854Hd3AOV0gP1XYbNu7NeXcGOTWuSKBJYq
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWySw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLbhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqnzd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7k16xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklXavoJBiKprzPLd
 MeTf01vJ1tABOnhjHizyNSKeWXLzsO9kzseDlAhiSXuwIm7kyRgXFohvD3pU1whK7Ve6M0md
 gsDZ4Y5Y2mNvVmC56VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.95,217,1661832000"; 
   d="scan'208";a="83623812"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFiqBxu7t0B66oqHnTcgM5NQR/J7XC249WtwBEioBU8e97nDIZ97BeMQNO+UTbl5z/6R12JqzJB8GSmt6wX8zCEfBQyVXMcbUvejAUXfoM67OnMOla9gXn/fX3QNtxXmVbPF8oBuqgBLe4FPzP2QjIUN5P08pgKSVufgyf8pzUN5p9Ssj5XcOwa7x7lGSTG9rzRwWQRjMMYqlkPdLzKFFdUd+z9bMRXtjOB49Mifc1qbOy1qPYlPoOWTOAjXvZLoM1dNv+sKcS3A6xsuXcwuEAeTU9QbDvoyY1KuF5EXuTzNxkRXp+0UCGbxukazRQwJGHBGEfQ6kY4R4EikmIokrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUXzzGq4VSx8sBvqH8bPi1ynt4HYx3T9gdXKxYW08cM=;
 b=MN0WSZ5gvCcQcQnfdz/to5x4nI+blQoqnKlp6AtQKuL7oCOdG3/ss2TPxwk859BGwH3+DEh0Eqnv9aAAfSPnKsOoSyDyvOJDyy9VDXMvBJ0MDF4DzM1clwK1MvR30jYvVtGLmCiORS1Q6gi3PVj05a6AP/IEvoGeHuRLyNI4te9zDksefohSUQ7tAJoB68WxYAAuWQMc1yP8OLMNOvmdEJeAcPfdyxm3/499oP4hNB4PKpti3KXhGdLMUaQnVS9M7RvaX1D/ZjuJOzgKbzQgh96+Qqg2nn2nmFKsQSPh294TMYQlFLV9j5VT1Fl1VPXRtD+ZzxlnydRTkRqw4FXsJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUXzzGq4VSx8sBvqH8bPi1ynt4HYx3T9gdXKxYW08cM=;
 b=Hx4Q3l31+rI+hhwH7MNwC39WD8e14BWkHe4rqgKkCC9zIghtMfQYmx4hA3F/Gkjzeugcg8kHjrqhlTMkOungTyWen++T7vOtitCqNKb3fKcZDc+BFZqnPMA1Y66MKPiIoFBCohilPbCdFKQ15XLS01sVkJ+IUhtdAtJYA/y4WDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.17 v3 2/2] vpci: refuse BAR writes only if the BAR is mapped
Date: Thu, 27 Oct 2022 15:23:15 +0200
Message-Id: <20221027132315.80592-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027132315.80592-1-roger.pau@citrix.com>
References: <20221027132315.80592-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:408:e8::33) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 924ec5d8-de00-48d6-ea62-08dab81e7337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L0iRnEDQzbWMdKqqAdjBuKN65W11XdBwfoYYu/Wy6uagVJOkVU5+sjjh36Hn9Gp7t09JlVEfxMQ+ChpYs0FGS9l09ZJJeYz540t+qS67mNmIVZwmLCrAzcM34PAdBz8X6mTHOFvJl2vnCkM9oACXSe4TgGmOiP0RlxSbn4qp/it1oV0rWLXH7LDJId+f+pRrqg5AWkCNIlED+sScKX1VTHH0v69kNOvmiHK5evaLCNTpymMa2bbrbV4kFmVUBSgljuWXE6C0JcSPnkdJ6wJeGKydrRpIbZMI2rnPEWwyXYFHXuezRkDB6UelXd6bfkJt6JzaFhSkUdliOhtpxR+EW5JruBLDjXAV7LL0o9TTR5ywAwDvjPvamYpv8PEAC1NejDMoM4kG+SOU/rg2rGjNbEc5W0zie6TIJrrfzBHVmmlB20NkwPlPxrK5ovI9gH1aOCj5RJKgCM0QXXKH3POM94QsiiNjhroKGvpv341YJ3iL1Y9/vJj7IYG27gZJGG8C3N7iA/yvR7hLvv61/DLodmXtFe+KDlxeGIiF9xg8K0Z9CkCD2eZvQxD9xn8Iae81c/ugaVeoSD0zJYkfMDaBLSmxNEo2yqn+Z/Pd6WV+XEsr6ji+HTK0Y/xrn8Kek2qU7X29NaOStqPzHS4nM3ak3Haftil5m6b/HtkNtUrn4BqSJfIrW9QOpbPHEfpu5apQhccb3CUUF0HEDAqsg0RPFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(478600001)(83380400001)(6486002)(6916009)(107886003)(6666004)(82960400001)(1076003)(4326008)(8676002)(36756003)(186003)(66476007)(26005)(6506007)(8936002)(41300700001)(38100700002)(66946007)(66556008)(2906002)(316002)(6512007)(86362001)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3MvQVdNdHYwYU9yUloyODVGZ0FtK1BGS216dEhTRkw2Nk9GMW0vZVN5aEpF?=
 =?utf-8?B?YUNta1ZkMEVCbmdVRUxjemx6QXI0aHhXRUxWd2ZPTi8zQzYwRUZuUUw5dWU3?=
 =?utf-8?B?Q3VVb1hZa0IzZit0STBWbGo0VTJUeSsrUGtIZGhlaUcwc1ZGVkZjK3NkbW9W?=
 =?utf-8?B?MTVjODIwOEJCRm1OT1M3a09jZ3NVMlpxNWppZmNtN2FpZWZGY2FXNzNiejlE?=
 =?utf-8?B?aXlwcmppQ1VNVnI1bHEvQ2N3UHNIOTBiRXdyVkpuOGJrNU5UNS9DcmlpMUcx?=
 =?utf-8?B?R2Y2Q3RZMTA0ajVpVmlvOUdsbngzMHAxa3Q4TDVVTzh2K3VvM0tLQy90MEl2?=
 =?utf-8?B?UTFtQ0M1Zzk3bUlQQmdaaUJ4RTZONWlnSEhRK2ljbC9hQ29VaTZZME1KZTI3?=
 =?utf-8?B?VFY4NXVvVGl2cndsSWVVWGtPNWNZUXFuLythNzlFK1JVcVY1dE8zMmhlclBZ?=
 =?utf-8?B?cUdKSE1Vb0dkekl6YTNCb1ZQRVRCTTJMU0RjQ1FBWHdReVRON2c4c0JCU0tT?=
 =?utf-8?B?NUFDc09zT2xEUC9BU1NRL2wyN3laWHpSN2ViSURaVmNlZlliWlFWTjkxWmh5?=
 =?utf-8?B?R0V3VzhJREhVSE8rL2NOei9RRDBFNDBYMFRNbEVMOXkrVDVFeEtoaG5sSGRo?=
 =?utf-8?B?SkNGUzBNL21tSURwRGowL2hGelF0OVhmQkZKMVE5QmkvQ1RXZ05oMjhZQUxw?=
 =?utf-8?B?V3hTdUlMRWs0MjVzUlpyREE1UFVtek1FUko5YnA3Qk9md09zRHlwVVMva3lF?=
 =?utf-8?B?UktZRDNlKzNaYXNwUFRnaFpEZnBYMzh5Sk12aFlpT0JVbS95VTVsMGs2RHFG?=
 =?utf-8?B?N0t5R1VFN1c0UjBOZ3ZqVW5QUmU1RWYvR2pHVE9qcWpnek0rZVZOa2Zrd3BP?=
 =?utf-8?B?Z0EyY0tJd1pDMEdkN0oxaGo1WmI0NkNrcVl1NFJDbjRZSU5QRXVTa3hsY2M3?=
 =?utf-8?B?TExOMXAyZGJLNXN0dXBkYlFWWE9BVFAxN0NJKy90STVTZEJ4NlVOU000b3Ro?=
 =?utf-8?B?RmE5eW9YK3BobkI3YjJLRndHdjJSQUEweHlDQXRXMVZhODArM1hCYnI1ZnM1?=
 =?utf-8?B?S1VqOHRPakhwR1YwaVNUdVVRTndqb09GSnhiRlkxaEhCWHNEZ2xQR2hRdnVD?=
 =?utf-8?B?aVJsUWlqUzR6QysyeGRIbjFGanl0QkNkSUNLWjhoQmlzVzBoUEpvWVEvRWtQ?=
 =?utf-8?B?dnpSZlkwMGZZc3Ezd0R6VlNtOEV4cWN3VmNReDVFbitUNHltKzREZWw3QnhK?=
 =?utf-8?B?UTFuRFdNVWV0OUJzTEE0QUZjZzhVUEV0eWV5bG9Sejg4USswb2hYZkNKS1dY?=
 =?utf-8?B?ZEhHdDY3M0hyd2YyYVlpYzVzMGgvL0hlUGFjeE9ESWUzSGthNW9ma0tNR2JC?=
 =?utf-8?B?NlNMVUJ2QnpCdk9DTjhoU0h0dUUvclg3SERPVXd4R1EvcEZ2a2ZUclVSdkZD?=
 =?utf-8?B?azZSYmttaFZGdWJJR1UxeWowSUM1YnMvWnk1cEo4VlJrQ1MzZVlkd3lDbXB5?=
 =?utf-8?B?ZzlwcVJiU1lvdTVZYXpiM0k0VUk1TkZoRjcwZ1VLMWhLam1yM1YzbWE0MmY4?=
 =?utf-8?B?bk5SdHZ0RWFvL21YTGR3em1OZUxUQWFBejVlSEwxRkRieDRNQnEwYXNqTGUw?=
 =?utf-8?B?WDdueTFzWnRRQzF2L0NDZVFnRnk5TkQraGUyek5vdGtFeDJxT0RiZE9HSTRK?=
 =?utf-8?B?REQ1MWdJalYvQUZqdVJEMzBGQWlKeEN0MHkweWVtYnhQcUdzSm9pL2lhd3ZV?=
 =?utf-8?B?aEhNc1Bkb2V0TGQ3dlltWW1sRFVjTVAzbFlvellRQ2QvT3I0dU54amowN1Iy?=
 =?utf-8?B?eWZQQW5naDhiMWg3Z1ZlbnBLTlpJeHRZdXZQWXpGOGJxWnRBeVU5ODNOYmdl?=
 =?utf-8?B?VGRkMUZ1Zmp5akVvcW5MK0RsUmMvSVZRZC9RTU9DK3AxMHVNYUFoZG9FeXV3?=
 =?utf-8?B?WTExYWhEc0ZHMXpYREh2Y2ZXN0hNWHFRSUdnZEVHZUd6K2lWZklZQndGcWxq?=
 =?utf-8?B?TWpFUE1iQWlQeXFGWldGV1BaSVBLVzRDUlJ1UGIzL2hPcUpkd28wdGc5UWs5?=
 =?utf-8?B?eVZlRG1pTjBUQnJSNnEwdExLL0Z2Mm5HdHhXYldmY1lQZ2REV29TVStodmJI?=
 =?utf-8?Q?wjJaWrnohwuNphUABHisJXbV7?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924ec5d8-de00-48d6-ea62-08dab81e7337
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 13:23:35.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4K7Wc/XwjOl/pjwrR7athEAG16ev81WQ9kD0V+i5p1OhlWbsnNJ+KNBwOy0TfjFhPLssljKiEl2k3PJlJnLliw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6377

Writes to the BARs are ignored if memory decoding is enabled for the
device, and the same happen with ROM BARs if the write is an attempt
to change the position of the BAR without disabling it first.

The reason of ignoring such writes is a limitation in Xen, as it would
need to unmap the BAR, change the address, and remap the BAR at the
new position, which the current logic doesn't support.

Some devices however seem to (wrongly) have the memory decoding bit
hardcoded to enabled, and attempts to disable it don't get reflected
on the command register.

This causes issues for well behaved domains that disable memory
decoding and then try to size the BARs, as vPCI will think memory
decoding is still enabled and ignore the write.

Since vPCI doesn't explicitly care about whether the memory decoding
bit is disabled as long as the BAR is not mapped in the domain p2m use
the information in the vpci_bar to check whether the BAR is mapped,
and refuse writes only based on that information.  This workarounds
the issue, and allows domains to size and reposition the BARs properly.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Use domains instead of guests in the commit log.
 - Add comment about ignoring {ROM,} BAR writes.
 - Use rom->enabled in rom_write().

Changes since v1:
 - Cache setting of memory decoding in command register.
 - Reword some log messages.
---
 xen/drivers/vpci/header.c | 31 +++++++++++++++++++++----------
 xen/include/xen/vpci.h    |  6 ++++++
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index d272b3f343..ec2e978a4e 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -131,7 +131,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
     }
 
     if ( !rom_only )
+    {
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+        header->bars_mapped = map;
+    }
     else
         ASSERT_UNREACHABLE();
 }
@@ -352,13 +355,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 static void cf_check cmd_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
 {
-    uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
+    struct vpci_header *header = data;
 
     /*
      * Let Dom0 play with all the bits directly except for the memory
      * decoding one.
      */
-    if ( (cmd ^ current_cmd) & PCI_COMMAND_MEMORY )
+    if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
         /*
          * Ignore the error. No memory has been added or removed from the p2m
          * (because the actual p2m changes are deferred in defer_map) and the
@@ -385,12 +388,16 @@ static void cf_check bar_write(
     else
         val &= PCI_BASE_ADDRESS_MEM_MASK;
 
-    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
+    /*
+     * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
+     * writes as long as the BAR is not mapped into the p2m.
+     */
+    if ( bar->enabled )
     {
         /* If the value written is the current one avoid printing a warning. */
         if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
             gprintk(XENLOG_WARNING,
-                    "%pp: ignored BAR %zu write with memory decoding enabled\n",
+                    "%pp: ignored BAR %zu write while mapped\n",
                     &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
         return;
     }
@@ -419,25 +426,29 @@ static void cf_check rom_write(
 {
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *rom = data;
-    uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
     bool new_enabled = val & PCI_ROM_ADDRESS_ENABLE;
 
-    if ( (cmd & PCI_COMMAND_MEMORY) && header->rom_enabled && new_enabled )
+    /*
+     * See comment in bar_write(). Additionally since the ROM BAR has an enable
+     * bit some writes are allowed while the BAR is mapped, as long as the
+     * write is to unmap the ROM BAR.
+     */
+    if ( rom->enabled && new_enabled )
     {
         gprintk(XENLOG_WARNING,
-                "%pp: ignored ROM BAR write with memory decoding enabled\n",
+                "%pp: ignored ROM BAR write while mapped\n",
                 &pdev->sbdf);
         return;
     }
 
-    if ( !header->rom_enabled )
+    if ( !rom->enabled )
         /*
-         * If the ROM BAR is not enabled update the address field so the
+         * If the ROM BAR is not mapped update the address field so the
          * correct address is mapped into the p2m.
          */
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 
-    if ( !(cmd & PCI_COMMAND_MEMORY) || header->rom_enabled == new_enabled )
+    if ( !header->bars_mapped || rom->enabled == new_enabled )
     {
         /* Just update the ROM BAR field. */
         header->rom_enabled = new_enabled;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 67c9a0c631..d8acfeba8a 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -88,6 +88,12 @@ struct vpci {
          * is mapped into guest p2m) if there's a ROM BAR on the device.
          */
         bool rom_enabled      : 1;
+        /*
+         * Cache whether memory decoding is enabled from our PoV.
+         * Some devices have a sticky memory decoding so that can't be relied
+         * upon to know whether BARs are mapped into the guest p2m.
+         */
+        bool bars_mapped      : 1;
         /* FIXME: currently there's no support for SR-IOV. */
     } header;
 
-- 
2.37.3


