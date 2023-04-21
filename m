Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A01B6EAB49
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 15:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524587.815640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppqXI-00031I-GL; Fri, 21 Apr 2023 13:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524587.815640; Fri, 21 Apr 2023 13:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppqXI-0002zC-DG; Fri, 21 Apr 2023 13:10:48 +0000
Received: by outflank-mailman (input) for mailman id 524587;
 Fri, 21 Apr 2023 13:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCD5=AM=citrix.com=prvs=4680c1a37=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ppqXG-0002z6-GJ
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 13:10:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaf116ff-e045-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 15:10:43 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2023 09:10:27 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6650.namprd03.prod.outlook.com (2603:10b6:303:12d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Fri, 21 Apr
 2023 13:10:22 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 13:10:21 +0000
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
X-Inumbo-ID: eaf116ff-e045-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682082643;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7SjmdCkQxSqN8/36rX5cL+xkunrfFJGlOH4Cqx2reN4=;
  b=UWHaAWLcI0cKX3W3jXoRaur14pdqOI05vaxYB+coZ5rQ06MnZ7aXONZK
   +1+DJrGmqhQ0ZFI9F/0lBfCjbuDuMRly8VOeDO4Go/IH9BQPmkc3KQuv2
   Q0xzEgpAzd1jDXlCiuifePRLyXu0l2fw8pvq2vd787PWoKZveXpAWalw+
   w=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 105155355
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lqkICqln/ZAQUBC8JL6UzTTo5gwPJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZUGCGOq2CMTH1L4p0bN+y/EJVv5LRzIUwTQQ9pClgRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5gaGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 c0nCiAQNRDAvuWV76unS/BCvuYOK9a+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieC1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHumAd9PT+DlnhJsqF+0yT08OQUbbFyA/vua0mO0YfkHK
 UNBr0LCqoB3riRHVOLVYRq8p3KVuw8GbPBZGeY69QKlx7Ld5kCSAW1sZjxLZcEitcQ2bSc3z
 VLPlNTsbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bpg3LZsZuFuiylNKdMTPtx
 zGHqgAuirNVitQEv42g5kzOiT+oopnPTyY26x/RU2bj6Rl2DKa9bpGswUjW67BHNonxZlqMo
 nkC3dSf5eYmDJeRmSjLS+IIdIxF/N6AOTzYxFtwRZ8o8m31/2b5JNgIpjZjOE1uL8AIPyfzZ
 1Pesh9Q45kVO2a2aahwYMS6DMFCIbXcKOkJn8v8NrJmCqWdvifclM2yTSZ8B1zQrXU=
IronPort-HdrOrdr: A9a23:ICbwR6FOIPtgqAgQpLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-Talos-CUID: 9a23:4s9zmW8mjEvQ2NdmINiVv38rONA4KX2e9XDzDFakCH9HcJ+4TkDFrQ==
X-Talos-MUID: 9a23:SQPDsAWjSoSAD47q/D3Li2BNBd9l2qOVV0IuybgMgeLcNyMlbg==
X-IronPort-AV: E=Sophos;i="5.99,214,1677560400"; 
   d="scan'208";a="105155355"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHdm2sSKpcnmfZi80qV+wUB+k+l8NQn+2osEYgzwQRNkEqdrSFh0zSEz5BoenEa43fTthId0bxatyLuiIolaC6aFVCmbPTJuFEE81EtdzLKfCG4miPNsJeW8BNjq5u38cNNflrSKZko8R3kubqKrnvETbP+gUTONmTBS13J6/+gLgH6zbRPxmIRxd7PmClCVA9+P9N2SeSAWygDU370JOBXVLYvt0g8QcQNy5Yo8fub4sMRlb5WXNZCcFKeHWkRmS7QgkkI2mSl5jCOcLbIzXubBLDVr5Qjkd+1a/mW80AvJy6DLKxVnF1PakHxz07GlpCV8ZivJzauXxtla6NLhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qv5ZHajn0vBl0eLZr5IpUzgdNceGnmYicG2G4mzKcA8=;
 b=i3cMjGp/n0iFPSOmssK4MI72GHL7wUsu7XluEzwSAhvMfsHfKNOSqM1Je6AAhVmEOn0WKUVlVn3xw43fe9aOcOhxhLtWId8TtwncCkYlSMlCqxxgDH0lYgr+0wMuUeg0/b8X1X8g1wFxGaXsCI72cLisXSLmt+DZ3UDf8BDbzaMVQDYPeWqowtaZp/ubsneCVQ9uzn4KXzqk415701WVpfINxivO964qRFJIVBjIcJofOayRmmqIAAZXUvBOmIgOFIK8Y/MBINsXUXZahVQbv5YJQE3gKx4pHt5K9H8tkdYnY/gKNAYVWvj49DYPzlvWJ8Kymb4u38qIjxT052xNOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qv5ZHajn0vBl0eLZr5IpUzgdNceGnmYicG2G4mzKcA8=;
 b=GQWqcZvgwBEyT0V/MM8zHISh9DWcEYZepq7CHipz9fY03PsD5g6YnJP2HY19/itZodM2QoxaT5vKjEUB6W0p84FnbfJjQH2+jbSKFecWDBFDfT70VbsorV259kScJaGgOCm0i1VIQdL115wVmUuY7KyIwCii7mkmJ4w987Lt6ZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Apr 2023 15:10:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Message-ID: <ZEKLN8AlzDUckorU@Air-de-Roger>
References: <ZBNA9q5DXJYG3KVp@Air-de-Roger>
 <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger>
 <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger>
 <87leivw8qp.fsf@epam.com>
 <ZD0cyXLt1knXyUzA@Air-de-Roger>
 <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
 <ZD0krtCOrEwiKMFP@Air-de-Roger>
 <87354t8pqg.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87354t8pqg.fsf@epam.com>
X-ClientProxiedBy: LO4P123CA0488.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: f46f449c-afe2-46cc-f947-08db4269c329
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BsagWIORd87UW+DrQ4kmPSiE5I3t19owR7jjmWkI6g6P/rLGt30zRPXesdN2UrjlhPIyQcCksMIQos9U3DgGbNUZn4D/v4zdRJamYBRmpy1z8H+GLnSsF9cGBt3ix9BgLm78bATq84i0DaCO79pRr82h6rGIw6/BGXCwcQ2GRTD0Pc4LD2Iip1EjqKlfeiRYh2uQI7BdfYn+0b1jourolTTqyKp51RvRrCXokLndjVlpgM8Iqp0wqVJ/mTMU+T5Im7Qvt+s8bu6WZX29tCIuXisq4mi6RbHZYRuuTsckyxiA+TNWgth1ixKXNlIznvDtnzrihTcP1SkBp58ic9pXzjpXxLACKxEtchvIcIupWvYpsVR62r3pR1L40Q0yPIfUDZblP3KfYDRxUeFzZHb+pH6T9eQDrSGeaAlGz8m5BO6UFdn5+VLOIt8EAwDz31cwO3aVgfo2310GW1UvZvIdqG5aWhWnulM5MRqKe8pCKKAWdJoN7ZCA+eQPAGF+v1FxJY5ftJe8djnHDByDveXbYzwvT6H7ww86nu1XgU+uuK0TbWLb7cTYf9ibv0HlHFeZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199021)(2906002)(66899021)(6666004)(478600001)(26005)(33716001)(86362001)(6506007)(9686003)(6512007)(53546011)(6486002)(186003)(85182001)(41300700001)(82960400001)(54906003)(8936002)(38100700002)(8676002)(4326008)(66476007)(66946007)(83380400001)(6916009)(316002)(66556008)(7416002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUxXQ1pZVzVzQnJ3WklQekMrOEhrT013QVRFNHdHMWZQYm9TQTl5U2FXdFNh?=
 =?utf-8?B?RFFHc1l3bUkxVng2TXcwaUdnaFQ3YmRKZW1rRGk1Mi8rQkJYbHR3K1REQ1R1?=
 =?utf-8?B?SmdMZDFTMmxFSUo2bndrNThTcTRLTDI1T0orZnhCalBFT3RLWWhJOVRuZXJ1?=
 =?utf-8?B?dkMvR1B2Q2ZKem1YQytXVE5YL1JaQW9zRDFyQ1lCNzFrcGhHMmZEeW9uUW94?=
 =?utf-8?B?bGY2MXNaSk4wdkdHZmVMK1JqODdDcEJRLzFPb1cyTzhnOStMSnc4Y2lTc3V6?=
 =?utf-8?B?REwvUGs5YlE1TXMvb0g5Y2ZOV0ErV1dXUi9zbndzSldKNDhTYWhPRjRiTm1U?=
 =?utf-8?B?WFZaY05sRUp3bzgyaDFMRnVVbjdPMEJBQXVBSS9jdjIyVmp2Z2drQ1NrVlYy?=
 =?utf-8?B?WlY3Mlk2Q0hwMVp1U252ZFdTUG1Rd1Jnb09oQWEySmp2UVBwWFpCTnNieDdj?=
 =?utf-8?B?U2ZtMzRLSTF2TndXZmhVOEZFbmRJWUxYVjc0UTlPOENQZ00wMXJid1VmeG9T?=
 =?utf-8?B?UHo1cW5DLzJQOFhlQmNVWHowVVlZYmZjWnZkS0lzS3ZZelZSOE5QTjV0M2g4?=
 =?utf-8?B?L1Z6TSsxbzFiUVBpYUduU091Z2xQK0Y0TmxCWkppaDg0c09hQmxmNGhHaUFF?=
 =?utf-8?B?QjdNS3Nlb241K2gyZVZHY0IyMmJtZVFoaS9kaFYvUzgzWXRqTVhQbWNQVzRU?=
 =?utf-8?B?c0Q5cnUxVmg0OVZOM1dTdXM4aFhHTXNMOCt0TW9XaGptbDNaczMyRThwdTBG?=
 =?utf-8?B?Mm1ocTdKVURCTTdFVmpvQWhQWUFzMU1FWlg0WjkrN0pVbWkwSEU0WGdYdmR0?=
 =?utf-8?B?Vi9JL0Ixbm9GOEFMNVg5aVljS0huNjBHUjZUTEJVV09DZTNkTlV4ektyZmg3?=
 =?utf-8?B?Ym5WN2t2Wkl2TEV5azlpTEJJNDVhazdwNWhnWUg1ZXlWSGtZL2VDQXJXaGk4?=
 =?utf-8?B?amI5NmpXSDR1WWhwck5YQ1FNeEpyd2JDRyt4QU4rQ3BIcXFmSUNGaVU3WkJJ?=
 =?utf-8?B?RmpYK29GT1lidUl3eXRYSUx2L0ZwSXI1RVA1aHBrZ1dLOWI2Vktrc2NISnhz?=
 =?utf-8?B?THdzbjM2YTJYOTV2KzFFNWpoVE5nNW5QUUc5UE50cy9LQ1RYNG5XU3BPVjhY?=
 =?utf-8?B?cXZvTGU2Y1Y2VUpQcS9qM0RuRDkwYW5nWUVMUGxqbkxXdG1PaFhxVDJsRmM1?=
 =?utf-8?B?Qm1UMTVodmRUUVBVQURlaXRtS0YrUjJxQm90d3dCaVo2NmFCV1p1bWp1NXFr?=
 =?utf-8?B?alJUZlc2NlZqemRpY3o0OVM0Qzk2SXJyekVmcDcrUCtTSWtJaThmM0x5MnNH?=
 =?utf-8?B?NHlDeTJmdzB6MTZRY0VPMmI4dEh6aDhIdGFkVURaWHJPVDNidkNCNXVUM3Vm?=
 =?utf-8?B?ZVhBaDREY1cwQ0FETm9xOVI0OEdtR0dTZmV1ZlE4dGRhekZrVGxYNHlOOEF5?=
 =?utf-8?B?N2dDVlEvMjI5R3lHMmdnWnJqVmpTWE10dXVsWlJXb3oyVENIRDNGYTUwRTJv?=
 =?utf-8?B?aWdJSUdtQ05TQlh0NXlSVlM4dngyRHN5dm4wNS81NkZhSkZjaWRLOTE2M0FV?=
 =?utf-8?B?Z3VEdHVJTmJtb0JMcE10YkxQcFdxSkViWlJNdkxKOTRLd2RiVjZBSkQ4RTNT?=
 =?utf-8?B?RXlMeVZmWU1WTTdRcVRlVjVsVnVacm95QXFEd2tTUUhFVHY1Tkkvd3ZQU2tL?=
 =?utf-8?B?Yk1hbUFOTlhCSVVoeXhROEZhcDhkc1FQSGlsZnY1blo5R1ZJQjZ1eFJ3TU43?=
 =?utf-8?B?WEhtR2hLdHJ6M1pSK2NFU1lhcUlRVW5aMEk5SUlzS2hlaWNKeEhTdnlWVkNK?=
 =?utf-8?B?NDBFS0JuYXFiT2t4VkN2YkwyRWc4SGJSR0crSGpyMzlIT3MxSEVUWGNpV3hK?=
 =?utf-8?B?OTgvRVA3RHRaSThVOHdRcHJ2NFRvczlFTWZFKzN1ZnAyUnh0THFDOE1CMlBD?=
 =?utf-8?B?NU9vdS9ZSTZqSzZqcnpza2ZtNXRtZitWTjNEZWtmK3NCTmFsV3ZVSnQyL2hR?=
 =?utf-8?B?ZS9NR3pCQytaVlVPcGRseVIrdTdmYVhyd2ZhdnBpOU5rdE5aWVAxbVk4SzU5?=
 =?utf-8?B?b2s1Y0tmeXM0cEljei9YK3dXRlllS0lZbnI1U3RCaFJXUVJPS25JRVZibWJB?=
 =?utf-8?Q?2uwfGedDgwtJRTuyDpRi+YgsL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CLsO24cNj1BdWY5EwjosCKIbAV6U1ibmxo/blappNdBcG4f/hRmoZXCMZ+YQ2if8ZSyti5714l3q31hFWyFEcnS7hR2piBKH/ztqt7cWL9wIlW7uiLhLMRLR+HWVTx4G8uwy82JmxxL+lHisy1O0RmIZSwg/ws12OO1iON6vPOQc9dFChEHtMwgzSslXJzFLTFlo3Haj2Ep2lBjp/W3z7LAZoM38DxPBwHzy1sr39VQpBPN2pCTxG/Q7fNgPiAgNNPP9bAf8vue1cm9JkAmHVeQVf95eLd6CP/cDC4wjoIlG1WXFMUwHcKe78vyFoZ6UppLuRx8inS5KhnfxgFLVo5flQFryHSYWH/VdHUJm+AmAZYscUpM14hs9GCJiGWpdVVLE0mrEshNiIcIxfyaJKKja8x8ONTJPc05fHdJpNxbql8pF8zy+sWlvEE+KmFnQ74LV+upHYce3yCqdYbXzL1dKO38vby6jK3HFDHsgn45RWM/BBLPkTvzPattbDKFymz6SGx3S/aa0e7wHyQ8YDg71gL/L3FqXpdOgzGwRTDZZF6C5s+d8X7IXy64O2PWpw+iyJsNgNrhqKNczVxD3wlQqzOvxVdXNyYSvBJK1D3OHvElz8e0uyZsUboW9JC3S7MRqNWza9v9h+2xowWdCrKsY9/yDTfGFHacUpPcOgl1zKGkp2lCIvpuyg4r6F4Q2x1CwU3xaV9hl7Vjr+/pFKvaDoMW/t4x/60NehcTwRZTSGWnkz47yfVe4cfnETlNfkPuP+b5v05SqM8XC47gf6VzYR4FNV1W9vjlFZAmZERpnOKtObS0Kdu4Fv4FXEn9TzRtx27ittCvCq3T6jQNkkcM495CycAy4yJS9mQFk57bbMU0b6D006wPohfDT681yHu0bYCtI2j0dlYqDY8fT8A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46f449c-afe2-46cc-f947-08db4269c329
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 13:10:21.9250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lB03F+xyTj/u2VNVqRxh3WNmkkVl3vl3CMbyXScUkzSY8WGK7rHJtmp9jq0pROPXqFA31EYdXDOy6k2FBthQXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6650

On Fri, Apr 21, 2023 at 11:00:23AM +0000, Volodymyr Babchuk wrote:
> 
> Hello Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Mon, Apr 17, 2023 at 12:34:31PM +0200, Jan Beulich wrote:
> >> On 17.04.2023 12:17, Roger Pau Monné wrote:
> >> > On Fri, Apr 14, 2023 at 01:30:39AM +0000, Volodymyr Babchuk wrote:
> >> >> Above I have proposed another view on this. I hope, it will work for
> >> >> you. Just to reiterate, idea is to allow "harmless" refcounts to be left
> >> >> after returning from pci_remove_device(). By "harmless" I mean that
> >> >> owners of those refcounts will not try to access the physical PCI
> >> >> device if pci_remove_device() is already finished.
> >> > 
> >> > I'm not strictly a maintainer of this piece code, albeit I have an
> >> > opinion.  I will like to also hear Jans opinion, since he is the
> >> > maintainer.
> >> 
> >> I'm afraid I can't really appreciate the term "harmless refcounts". Whoever
> >> holds a ref is entitled to access the device. As stated before, I see only
> >> two ways of getting things consistent: Either pci_remove_device() is
> >> invoked upon dropping of the last ref,
> >
> > With this approach, what would be the implementation of
> > PHYSDEVOP_manage_pci_remove?  Would it just check whether the pdev
> > exist and either return 0 or -EBUSY?
> >
> 
> Okay, I am preparing patches with the behavior you proposed. To test it,
> I artificially set refcount to 2 and indeed PHYSDEVOP_manage_pci_remove
> returned -EBUSY, which propagated to the linux driver. Problem is that
> Linux driver can't do anything with this. It just displayed an error
> message and removed device anyways. This is because Linux sends
> PHYSDEVOP_manage_pci_remove in device_remove() call path and there is no
> way to prevent the device removal. So, admin is not capable to try this
> again.

Ideally Linux won't remove the device, and then the admin would get to
retry.  Maybe the way the Linux hook is placed is not the best one?
The hypervisor should be authoritative on whether a device can be
removed or not, and hence PHYSDEVOP_manage_pci_remove returning an
error (EBUSY or otherwise) shouldn't allow the device unplug in Linux
to continue.

We could add a PHYSDEVOP_manage_pci_test or similar that could be
programmatically used to check whether a device has a matching pdev in
the hypervisor, but I have no idea how that could be used by Linux so
it's exposed to the user, and it seems to just make the interface more
complicated for noo real benefit, when the same could be accomplished
by PHYSDEVOP_manage_pci_remove.

Maybe the only feasible solution is for pci_remove_device() to drop a
reference expecting it would be the last one, and print a warning
message if it's not and return -EBUSY.  Expecting any remaining
references to be dropped and the backing pdev to be freed.

Thanks, Roger.

