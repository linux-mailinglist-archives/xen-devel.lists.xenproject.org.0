Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A77611002
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 13:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431986.684682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNs1-0001IN-LU; Fri, 28 Oct 2022 11:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431986.684682; Fri, 28 Oct 2022 11:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNs1-0001G9-Gp; Fri, 28 Oct 2022 11:49:53 +0000
Received: by outflank-mailman (input) for mailman id 431986;
 Fri, 28 Oct 2022 11:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jk72=25=citrix.com=prvs=293452418=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ooNs0-00017v-3B
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 11:49:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a03b66a5-56b6-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 13:49:50 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 07:49:47 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 11:49:45 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 11:49:45 +0000
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
X-Inumbo-ID: a03b66a5-56b6-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666957790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=qY03LfRv9yDnW4Pz8QCS8mYG+gxyCw6inrJzCBoDSRI=;
  b=BztC+70rL+cQ2Oq8ZpNEnipK4x9bTZxWLc3/pMTRpt85cNdLrPjPJG7u
   dxN5ZnebFqO5ImRwQtLoDO1Tf00IPVv41YgTGFppzNcV+YTW3h/bVOWL3
   JJlyMQ5caJ+oWSuwMrHJ7bT5fTkhplpVFAzBQgOKilXhw+Vrm/M8iJzd0
   E=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 86237829
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HTwsm675D5TXIbC3xjAGYgxRtAvGchMFZxGqfqrLsTDasY5as4F+v
 jYdDzqGOPrfNzekfNEiaN+w9x4D6MTWzNAxSlc9+HhmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgR7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 e0qDDcdSjS4o/+MnoCJbftjgMkHFZy+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efw3mgB9JIRdVU8NY2h3K4mjQVWSE6cmCY5taeoGmcXIp2f
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWXQ3+A8rafrRupJDMYa2QFYEcsUg8t89Tl5oYpgXryos1LFae0ipj/H2H2y
 jXT9Swm3exN3IgMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2tYji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:5YTbAKpOe26CuJA16frIbS0aV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.95,221,1661832000"; 
   d="scan'208";a="86237829"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEOPmID/baK/Krzn9QyEgfUjyEvuLTwxYcLgU4BkFmms2a8PShD+RfFtvvYqKB08UnVfbswluHcsT2/W1OSrK2iIzTi84SykhqpxsWv/e8wNFEWUuTy7Ub/khx64ly5bm9oEVnZBJx9OFjlZ8a4O4CwTB7qzkqdcfOsw7FKeEj2RTfba7WSGxSOa8W6iM6Q0KgozBaV/zC5npuujq5lGQwBZnH3dvigg6eO2i4qndetPhOXoYTRTLJ57GyCiob2QvIdSTm6I9Al7JCd+Pi+uxmHsmVs3yxFCEBbdqACBhmC+w5lEdax7END8MLCALZv3ktp7xcG2aDhtIlRiq9J9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjwyPUUW6uvA6MFC/wsykxiv/QG5N/oHoiqE0L+rAJQ=;
 b=L5eVJGYFyQI9d22WjoInJ9NVjyFzrxOE/WVoOp8tkzu9l/UIJ8O2txUydPW2zQBNvL0iZ5p5nbtfNW+zGzKeSw2n9LP58arGMO/rHQzZ0PhfKR8ngFndtdZv9lc2QEHylBM+Pxy+zV5z+JN9DwetLeNdat28RbZ65v8uNLRACtJqYgnQby0upqcUqP9hL7SxaBWli1PNcQEK/zBhbctsFhySxhHMxwfIxzIR0wnTCl/J5YFmwsjpOAgTy7tt9zmIh13Mo1bI0yJEbE0Dd2UzTlPwP9EA2YAYVoiDP7Rc1ETxUkkOIRn9ECf7+0jLjzteLvZlZI2n3IXQiJTRfHHdCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjwyPUUW6uvA6MFC/wsykxiv/QG5N/oHoiqE0L+rAJQ=;
 b=gqJCac6NZh7B4LdoIZ0mgGSK/cM0nDWf4o8eDJWkvZlvJ3M/nD8JXXNx7Sw1atWUAUzH7HToYa0cihSqUYgJuuhqfVH6CApomKIHJe1aTzhqSTrsauh66Q7gDtxoO54SIcFovD7eVjApqfpP5w4wD+QFMaEDkKy1yvdQQJwDQtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 v2 3/3] amd: remove VIRT_SC_MSR_HVM synthetic feature
Date: Fri, 28 Oct 2022 13:49:13 +0200
Message-Id: <20221028114913.88921-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028114913.88921-1-roger.pau@citrix.com>
References: <20221028114913.88921-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0154.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::22) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbb5d6b-ca1f-49f0-09c4-08dab8da81d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HZMGuXyok84w1jfA/gyWHXKzyGHu8D+P3y/XWYqpEdj0ayu5uoME/eC34JCL/Puf8KAUb2oflfiEKloi8PluZHcZ+IZuTHYzdaMvWrxnd9I6tWz+ig3zW3gJ41dcV6CSPbNek45fP0icTbWojpC0fiET8z91+ZiQ/je93xzMTKlr8Zs746y+4+SCcMRSD/9M5nk5wtCKZThiKgaSh/rxHdAXr4Fnij63co2AIwmrQfJeC8K6tIhbv/WV6pyzkW4KHh+sgQMhnHt6G/GWSl6bYGm2L57pgIWkw1FEuBa6dJusCIhsq2PeYLT/HFSVS3FICTxfJf+8b7fPNrcosWiRErUtT8gOv3/oIrDhyhOCZ+LKv7D0e3vtpjm2mvJIvsbIDD5AL4JTAfEQNtJpma0M14zwCOCWTo1JcvtH8oa3H/XIo5J+VcKq5JsPbUYSKJLEMnfW9uaRp2hevOCakBcFaOPJp/ZIQktrtyZTX/Gt6n2Xpp5+MKToHQbEaavhKKRMRTBpeQ1UhZ7ILtURYuSJTWNP0NNAuUmNvKPjV+LbKeImVI2zhvDgVvj7yhRn7DlM46ZVywPv3UeormxUuAbwBz9gJTExcS9efkLX6PIebz2+Xs4tcij+vSkmHvSalEfNLtvQ5NBFkst0505Vgy49HlWmyR4o399NMlFqxCIoJQYiUO10EPIoaZnGHQushRTJTE5Wn0rzP1BZyqUexRz7JA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199015)(1076003)(186003)(2616005)(6666004)(26005)(6512007)(6506007)(83380400001)(2906002)(5660300002)(54906003)(66476007)(6486002)(316002)(6916009)(478600001)(41300700001)(8936002)(66556008)(8676002)(4326008)(66946007)(36756003)(86362001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0N5QVUzV1dGRHY3MlEvejBON3VTWmRURFVmUUUwbHhkdmVhREZuQktkU0py?=
 =?utf-8?B?Y0dtZG1qNWtjRWtPRTRlaTNGME5Pd3ZEQ3JMMER2MTNra2NaT3pra3MreW5C?=
 =?utf-8?B?YTNwbmRCWjJmN2FoeUF4OGVQLzNJRmlqeERpcyt5SFhYWW5PbWMwNUd4Y1Jl?=
 =?utf-8?B?TjRXYjYxaFNhNWt5SmFVOWh6ZVNIR25adjJxRWNkRlZUQnZLRWZ3cXA1eWJ0?=
 =?utf-8?B?NFBGZlMxZVB2Y3dyQ2ZGUVAvenZ5ZlpiQmRISFp0eGUyVU5EMnM2V3J3dnNy?=
 =?utf-8?B?Z29PQ3poNGNldnd4VkMvUFEvV0pKQ1BCME4rdGUvT2hyaU8vS1lvYzNzbmFV?=
 =?utf-8?B?ZzB2VktLK0RZM0VDQTV5WGQzTGlKQUxZbVlCdDNaTGk2eVZYdmxjdlh4Q3Bj?=
 =?utf-8?B?Z0VYYkZiblp3OXpZU1Rrd1c5YWtVUW9tT1FQbFRnMjRJYXhYYTlzRzZjaXdF?=
 =?utf-8?B?R1IrMGFERDRKWkRTMUJ5UTF1ZTNyRjdPUm51WlpTMENoZ0VDM3dyUy9wTW9z?=
 =?utf-8?B?azN5VTJPRURoalZ3czJkTU9LWG1tZ0thZG45VVZwcUpmdzhCRG4zRjJMQ3hm?=
 =?utf-8?B?am9oM1NxREVRL09wb3pzSEVsa25oSFR0NktoZWhDV01qejVUUXR6cWRwMDhS?=
 =?utf-8?B?UDgyUy9BcVYyQUE2VTNYY04zQTdqV1ViLzBJcEx5Z1JoaXFMam5Jem5WeUp1?=
 =?utf-8?B?NkFZcERaenN5RWQzV2o5ZDA1SjFIYytRTy84TDdyL3NsV0NCWjNpUmJUZm12?=
 =?utf-8?B?TnpqMkJsaytNU2pBazE1RUZrRytmWnpHZllDSkRrUXhWQm96dVpkUEZPbS9x?=
 =?utf-8?B?ekFmeXlzaFZMMG9MZHJBUWQwUDIvc3ZwQXNFSzJhYWxzeDZsZmtpMVF0L3ZH?=
 =?utf-8?B?ekR6S3N4dG5TK2xKbzVVakZrN3ZxV0dxYWdUWktDcGV1bGQvNjRLR2dGenRM?=
 =?utf-8?B?RHZ3L21vNmhVUmhDc21sRW80Y3RQWDd4Mk5yVVlaQ3QvNGx0aGptQ3B5L2g1?=
 =?utf-8?B?eTFpTFRyM1BFT0JmSW5kUEYvNmlXc0V0ZFV4K2dRbE9Va2ZORjI5VHI1b3Fo?=
 =?utf-8?B?RnVlZDg1cXg4Ni9ZNkt0UXI2ME1MWDNRQXFkN3VFZzZRc0tVNU9zb2xXaDcz?=
 =?utf-8?B?bkZhMFFzWDJxTm9FY1RGWFk4MEpFOC9CRTVraU5PeGlBZHgveVFQZG5DZFZN?=
 =?utf-8?B?S3lvZHZoSWFRc3hvTHNnYXZlc3NjQTVaSHdFU1lkTk5KSXJ3YldHRzFHKzMv?=
 =?utf-8?B?b0V0TDdURXp6YTcwMDBBWC9QY0F2c2poMm5YREhZTzZaZWhlaHJIOHZWRWFO?=
 =?utf-8?B?OEF0blU2VEk5cXRjMlc0bm0xUTllaUtVQ2lNZjRlejU0MUV4aEQyNjBLWFNa?=
 =?utf-8?B?U0FtL3daeGszcUJ6c0hOVnJXM0ZEOXVRWnJPVTRHZ1o5cjEvSm1helgzU3M5?=
 =?utf-8?B?ZXJEczhwRTJmcVVaZWRETHpPbUVpWmx3MXdvd3JGTnkxMFVYb1RUYTczKzE5?=
 =?utf-8?B?dkduUVUrZU5DaGpERW1QM0FoRlFQTjhGWlF0ZExCOEtEVjBrb1h4b2tLSGVz?=
 =?utf-8?B?SHNNZENDMEhpazdFWFZiMElLMHdDNmFENjJQQVQ2d3J6c3Rtd2t4d0Y4b3lo?=
 =?utf-8?B?Vm9lVGNPMjV2SzhPaUFweVlhRElucm5ncWFYOHhKK0VhcGp2OWVraXJqRFNn?=
 =?utf-8?B?cjIyQS9HVE9rNlFHM2JJVkF0YmtFemE1bjZYVnVjZ0NEb3Jpd1JaOTR3SEdG?=
 =?utf-8?B?TGpKeFk3bVhtTytjWjVuampKWVBPMlZmQnQvU25WQWx4SEJ6NWpxa0ZtdEJr?=
 =?utf-8?B?WlJ5NC9YQnZ1R2Q2bDJuYVNKdVFxNUIwR0RBdlAwT042eFIwZ0QvVDVYWXRl?=
 =?utf-8?B?V2RHVnVoTkIwSFAwY1lSUGl4VTFJVzR2UXRIWi9qL0xwc1N3V3Nqc0xlUnF4?=
 =?utf-8?B?MExTenc2OUJFeHhySXR3TjFsZ24ySHMyS2tkYmYyZE11K0VMbDVvZElTTGVU?=
 =?utf-8?B?ZFAzRnUwVHhNYjhRZmRxRHlrWFcyUk5wcVVOdzBNd2Q2QkF4UTNWNmJzY0w2?=
 =?utf-8?B?anBBbDZtZGpGOG44OHcwWEJwblJWazVWRDVCZTdRNDZwNHBXTHVDTUlHczRn?=
 =?utf-8?Q?bMO/zOnODMs/95m02hNfgjRnl?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbb5d6b-ca1f-49f0-09c4-08dab8da81d7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 11:49:44.9581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qY0hCGYjZ/zaHqN19D0DX+l3NqgmdfXKHcT/RS6UilcmmnFmLoa5Ned/Uni3HMyl/veMOgjgnTpvH3Iry6Js5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6027

Since the VIRT_SPEC_CTRL.SSBD selection is no longer context switched
on vm{entry,exit} there's no need to use a synthetic feature bit for
it anymore.

Remove the bit and instead use a global variable.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/cpu/amd.c                 | 1 +
 xen/arch/x86/cpuid.c                   | 9 +++++----
 xen/arch/x86/include/asm/amd.h         | 1 +
 xen/arch/x86/include/asm/cpufeatures.h | 2 +-
 xen/arch/x86/spec_ctrl.c               | 8 ++++----
 5 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 05d72c6501..11f8e1d359 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -49,6 +49,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
 /* Signal whether the ACPI C1E quirk is required. */
 bool __read_mostly amd_acpi_c1e_quirk;
 bool __ro_after_init amd_legacy_ssbd;
+bool __ro_after_init amd_virt_spec_ctrl;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 822f9ace10..acc2f606ce 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -3,6 +3,7 @@
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/nospec.h>
+#include <asm/amd.h>
 #include <asm/cpuid.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
@@ -543,9 +544,9 @@ static void __init calculate_hvm_max_policy(void)
 
     /*
      * VIRT_SSBD is exposed in the default policy as a result of
-     * VIRT_SC_MSR_HVM being set, it also needs exposing in the max policy.
+     * amd_virt_spec_ctrl being set, it also needs exposing in the max policy.
      */
-    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+    if ( amd_virt_spec_ctrl )
         __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
@@ -606,9 +607,9 @@ static void __init calculate_hvm_def_policy(void)
 
     /*
      * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
-     * VIRT_SC_MSR_HVM is set.
+     * amd_virt_spec_ctrl is set.
      */
-    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+    if ( amd_virt_spec_ctrl )
         __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     sanitise_featureset(hvm_featureset);
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 81ed71710f..5c100784dd 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -152,6 +152,7 @@ extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
 
 extern bool amd_legacy_ssbd;
+extern bool amd_virt_spec_ctrl;
 bool amd_setup_legacy_ssbd(void);
 void amd_set_ssbd(bool enable);
 
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 3895de4faf..efd3a667ef 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SYNTH( 8)) /* APERFMPERF */
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
-XEN_CPUFEATURE(VIRT_SC_MSR_HVM,   X86_SYNTH(12)) /* MSR_VIRT_SPEC_CTRL exposed to HVM */
+/* Bit 12 unused. */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
 XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 4e53056624..0b94af6b86 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -514,12 +514,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
-            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
+            amd_virt_spec_ctrl ||
             opt_eager_fpu || opt_md_clear_hvm)       ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
-            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM)) ? " MSR_VIRT_SPEC_CTRL"
-                                                       : "",
+            amd_virt_spec_ctrl)                      ? " MSR_VIRT_SPEC_CTRL"
+                                                     : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_md_clear_hvm                          ? " MD_CLEAR"      : "",
@@ -1247,7 +1247,7 @@ void __init init_speculation_mitigations(void)
     /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
     if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd &&
          (cpu_has_virt_ssbd || (amd_legacy_ssbd && amd_setup_legacy_ssbd())) )
-        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
+        amd_virt_spec_ctrl = true;
 
     /* Figure out default_xen_spec_ctrl. */
     if ( has_spec_ctrl && ibrs )
-- 
2.37.3


