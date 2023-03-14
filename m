Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF246B8E8E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 10:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509514.785383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc0ra-0004DU-6O; Tue, 14 Mar 2023 09:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509514.785383; Tue, 14 Mar 2023 09:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc0ra-0004AH-2l; Tue, 14 Mar 2023 09:22:34 +0000
Received: by outflank-mailman (input) for mailman id 509514;
 Tue, 14 Mar 2023 09:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXSW=7G=citrix.com=prvs=430734c92=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pc0rX-0004AB-Pe
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 09:22:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd43cfe1-c249-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 10:22:29 +0100 (CET)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 05:22:23 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO1PR03MB5764.namprd03.prod.outlook.com (2603:10b6:303:6c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 09:22:21 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Tue, 14 Mar 2023
 09:22:21 +0000
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
X-Inumbo-ID: bd43cfe1-c249-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678785749;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=rNxcFQcCKVIylRyokFEqYiETWBBdt6L5RDLP7g9tOZ4=;
  b=HhFmnY3WtvwDWhICDkjJib7pjJXUPkUSLkAObYFbb6/pjQ4jim0oF/yH
   dnvgLmTmeCF9vVAQIEZYTHISjAqLDTlATzqCsX0QSxDqKPfJtQxo0qds7
   BFdnhTUCbgckNOeDUQeqCFyRnCIiten2DsRnv012Aa/2+uEGwKZ0pVp1t
   E=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 100114940
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9tagc6mbqLFtgj2Glsrkkzvo5gxPJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWDyPPveLZmP9fNBwa4yy8BkH7MCAzIUwTFE4qn08QSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QOGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cwSBR8JTCGovuSVm62icuBCq904I9a+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3ieexWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHujAdtOReHgnhJsqECx+XdMUy1LbHKQgqmGoBSZVslxC
 1NBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4qjJ5weUAEAUQzgHb8Yp3OctXiAj3
 FKNm9LvBBRsvaeTRHbb8a2bxRutPQAFIGlEYjULJSMV7t+mrIwtgxbnStd4DLXzntDzASv3w
 T2BsG45nbp7sCIQ/6Cy/FSCjzfyoJHMF1cx/l+OAT7j6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQcH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:odIvZKrWfs+l0qobSegPJJUaV5o6eYIsimQD101hICG9E/b0qy
 nKpp9w6faaskdzZJheo6HjBEDtex3hHP1OjbX5X43DYOCOggLBEGgI1+TfKlPbehEW/9QtsJ
 tdTw==
X-IronPort-AV: E=Sophos;i="5.98,259,1673931600"; 
   d="scan'208";a="100114940"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loEFYVhgdI2EeNDh9Fff7Dd1G1BTBmb2W6HNmABjXNF7z/ChyCMwGsybxFa6QsUs0n0QUMaJdiWI3HwH881whUQ9i7TvqVuZRq6ZQCobaipflKEi7ZxTo0fnfdH0LIvT4NrHbLpmlaa3UfA6oBOms2mXPROL3YWfRg7/tL1Tt5qJOepOu7p/Bb+2sMwGIf39/P3YDGOja9YPeKzc/OTq4cdkesz5gmxt94hW/Ofk/tVLzc5ZzUOlfZ/6ke9iotql/VCd0ndNvi07blgoSQWrZUgRIyajnRXDRdzhom8O/56J/ATQYcQB9oIF0plV4soxQqrGNG2DLPVde5GMLmVPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9i2mqI18arzPGqy/DUV1OvX1QXrC/ctsyR1bAg/QAY0=;
 b=gz3dl5m5cWPCUgHRsC3A9A7KN3rSgnFf8j0Xp6r7591yv1YbkOANXw7zJpmKMwSrW8tZNAAnlvr98tC8KYKHSMnkppHVLLyzPPxtgIc/1gmlTZcpvzAp1oadqVTkqSmKGoZr0+2LtZletxyinLsnazXLuSGH9dlSYVSghhClfjNNeDAdRu1k6eBOwWlLJLCRuTOI0C+RNpYRpl7+H+HsxBBi5WKBLo+3HKqTbrzwrpera9/F7ZM4zVaKiN0fq3016z/RNmfRbctqFwXfA78izGBU65HXqjvxjDiFo+5z0GNpoEOS0iaodwwDg5HVD4aToZZexbTej3CMpQqDQDBlPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9i2mqI18arzPGqy/DUV1OvX1QXrC/ctsyR1bAg/QAY0=;
 b=F15KMhWOJ8P41ajxO5fCNA7/e7N92Z4nkNo/2iDPxG/OwOwgQ9Tf6DRjB6xyOK+VkJZp5HxTJiH2KyD3CJ+f4GmvPWXD6ayF3kDmRcOd8c/KFQZNPpe91zXB+/5IaHqE5gH/UICntt5Z5f6TyS0TW2eR9wlcyjH58rpNSEXocfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Mar 2023 10:22:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/grants: repurpose command line max options
Message-ID: <ZBA8yORIxXRM3RkO@Air-de-Roger>
References: <20230313121632.86789-1-roger.pau@citrix.com>
 <2bcd9829-498b-228a-2a86-67f8c6e859aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2bcd9829-498b-228a-2a86-67f8c6e859aa@suse.com>
X-ClientProxiedBy: BN8PR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:408:70::47) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO1PR03MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d41040-36e3-470a-a5dd-08db246d9cc3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O68XxDtUwtXZRg2YLUWqpw+xWl5knNXuXgpfxv8OJw9KBzjuJJm6dj/GoToftww7Mu9RV1h0jMyaBEyHVzpIxC6XSwAhKJN7ChZqk57hfbaYvwCVgOBDPPb3+jFNy9HWf9H01MBOKGqrbSi77jKXzvRabci6EJP0kNNMQ4LJhNZqkrIDJALgFA4hNGKnPYNvWKKDu5xBKA7U4mwRtvS/k3xXZIdJxwBqRtjRM/FKv9na2AH2OAh8LQiA78l1gJK9L2uXGYRn21DUW6tEbXpQ1bDy/J1ceUWQABUASX1A1So2JQo1Q5JoXRLlfzUoQcO9rr2YIHhEF13MAQB3XyFrBjgF6ph7hzOouYL2AgPlaffkqGN7tnLaj626H9M1txfsqq6cwrurIgPZJjupA6ZR2Lj/uria0CK6SD1sbb/9T9e13LCLiv2h0Wk7BmXzDwWUYuil3L+kiwiD+ZU3ciSUK1w5eBiMoiD4OrPZuCBccfPGUiiruoYZ2hZHEUh9aZuPT+Q43wOLayEzE5CU/BWiNVpZPuk1XzZCzpnz42AgfpCZJ/VNIQWUIZYHSIrdh3fOt41MAqrbSkQVVbweIv3JuvHpgmxFIxiUa7kfHIl03KPcZgNI6kjJoaLugtdVk0uS636VfTWhgZdcMSQoDXACTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199018)(33716001)(86362001)(85182001)(6916009)(9686003)(6512007)(26005)(41300700001)(53546011)(6506007)(4326008)(5660300002)(186003)(8936002)(316002)(54906003)(478600001)(8676002)(6486002)(66556008)(66476007)(66946007)(82960400001)(38100700002)(6666004)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckRscHZFT3BKNFBHK2RrYkt0L1BVaEY2RVJweHpZK1VnTEUzbGhqNVNSZW5z?=
 =?utf-8?B?bENWenBtOHM0S1ZqVjUxZElzckR0L0N5NncvclpMSUhydTljVktXTjdqdEVi?=
 =?utf-8?B?SVZqajZ4U0lEZllKd2ZJRXFVc2pEbm0zUGlYMUxodGlxei9kc1laUmpzbFpr?=
 =?utf-8?B?WEw2WkZkdk9hTzFKaVZIbmg3Rlh5K2NrcVlMcDd0WEdSSGh0U2NZQ1Z3dzUr?=
 =?utf-8?B?Ky9pY1FkRjZVN0llWVkrNktIcmo3N1hibjRyUlFPRFg3cG1kUXExeWwwWU15?=
 =?utf-8?B?U1V0SzhBcUJjUUJPSC9XdEorQnBONjNYbXFwOFE5N2ZPL0htanFVdEZQQURH?=
 =?utf-8?B?RVovODFOelorSVpjc3VNejFTTU9xdGZRQm9nK001SFd3VnNBSlFJTkxZWEo1?=
 =?utf-8?B?TUxwQzdOaEZXajZyTEhaWlhOSW91cHJMVXMxVkMvNlY0aGNMajJUdmVhMmZ1?=
 =?utf-8?B?b20zR3VVOTdwOXZjaHlrUHVqYmFGWWFMTWg5TjNnV2p1WDJtYy9KVWsxUjJs?=
 =?utf-8?B?bjN5alhrWTVhOHFRVU15RWNvWFdabnl5bE5lTnVOQXBzSzU1ZU5iK2t3OTFm?=
 =?utf-8?B?YmpQbSs2MDhsaW5yL2tFSkFrWHREdGRMVjR5VHh2QVNGYUt0aVpFdGtUckl1?=
 =?utf-8?B?a0VNc3EwNnZEakRCTWVabi9ma0FyenNPUEhOeTBMWi9pMFlhR0QzRE4yV2FW?=
 =?utf-8?B?TWoxSWpCaVNyOWs2VmdzanEzVjVlazR2WGt1NU9rTGNQYk1xeGk4WjlCcnQy?=
 =?utf-8?B?UUQyL3FKdzRrZzJWbW5MMlRCNi9sbVJxdXVEWVZLblhMTjNoako2Zlh2NlpQ?=
 =?utf-8?B?d1ZUNUFWLzJVelgycDBDSWFWYUxlZ3AvNFNjR044L0FCZEVVY0RUM2ZqR0N3?=
 =?utf-8?B?a0ZyWWQxMVRaVDlQVlhXU28yUkRIYkVLN0Q3NGhkeWM1K01LZzczU014K1RP?=
 =?utf-8?B?VUd4OEVzR1h2eDNHVmpOV0M4eDZsS1o0OFhxeDM4U01ta082cnZHd1ZvcDgv?=
 =?utf-8?B?WUJyMmdyQzdRRGp5WHJOcE54d2dKZldhb2tvNk9PdkphZG5wTmY3ZEFWRE8r?=
 =?utf-8?B?UHFVbHRSTWF2R1dYU1NnK1ZLbGY5bU91dndKSjlhWFNTRnRzQktrczRZRHFY?=
 =?utf-8?B?Q01WRWlEMUtZcXVRanM3ZlRGRC9WOWZrOGsyQmN6WDlNbU5WbG5QVWd3WGsv?=
 =?utf-8?B?T2ZBa1VlcUViTHE1RWVlSFZRYUZhRk9GL0dyVEo3OENKcEplV2YraG1UL0s1?=
 =?utf-8?B?ejllM0ZlcWlsQ1c3M0xBR0lGa21iaFZ5QTI3MFhucmhOY1ZIUXRpSFJHWURU?=
 =?utf-8?B?LzVId1ZZeFdKQWMrY2w0VlU4Mlo1UGVPNlBFbzBlV1hVMk1OakhwVVhRUWQ3?=
 =?utf-8?B?bjdKZXVLWGtkYjg0bDdtejkzWTNnRGw5Q2tiSFdkZ3BsMllCcXVhQ2c1TnRZ?=
 =?utf-8?B?SVMyNHhzMEdIT01kWXAyOUYvdDd5amw2bkU1MjdPenZmclcwTHNlU01IT1lY?=
 =?utf-8?B?blpWZUpmaGhwL3pYbmlJbCszN2szZENsL0g0WU1FQXhQaFlLUXpxbXdpUHZ6?=
 =?utf-8?B?d3dsTlpWSmtsTk1oYU9ON1hyUy9Hdm5HaEdZeU5VYlRTU3krbFF5UUJUR3pr?=
 =?utf-8?B?WmJSbmh0Qjc2dVljSU5PZjhSQzZXajcyTFJoREpMYUFNemZqQzh0ZGZxUVUr?=
 =?utf-8?B?RU9YMzZQSE55eHFwK2dwRUx6eW5VZEczaUFINjN1TWZkcGNvMjB0WmRib2VZ?=
 =?utf-8?B?NDR1cG1vcSt6R2k2cCt2L0ppbG8yVDl1VVFYVGVKUStuY0tDaW53ejVHVDNs?=
 =?utf-8?B?YjI3Ym1Tb1N6MUR0akdldllYMmlYRE5ZcWkvNDdDaUo4b1ZtOTFBMTB4bFNZ?=
 =?utf-8?B?UFI5Um0zZHR1eGxwOEd3MlBGK3ZQQWRJUGZUM3BFS0I3ZW1ObDdObit3TU1m?=
 =?utf-8?B?SHdjYXBUbXpaSEl0enhWK1pxRS95eCtSWjJvbmxPR2p1NlFoMlVoVHJVZFlK?=
 =?utf-8?B?TFZmTHM5R0hmK21WYmtXenlEZW5HWlF5Y1kyeFYrWEZ3bHpmbXVuaE96QWQ4?=
 =?utf-8?B?RmZld1dPSU5OY0d6V3NJZStFUUMwQnQ3V2lybVdVTWZrMjVSc2hsUGp4Rk9X?=
 =?utf-8?B?YTBXUG92WHljdS81ZU1zL3hRZTlxNlVGeGFXV0V0eGRTTWJQb0lGeDFYZjVp?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sHg8dscC6Vtp3ruhUssSH5O8tD/CTn5iTG/eFcf2yreuhh2G5/lJQqJJQcbCp3J6y50fkMKiReTXKAAK57LXRr0L9TEVInr2t80erUsP/WEOe1cLqdY3+SijWDSY94BI9QUVLw1VryI/+qVtsPJjAegL6+fjEMLu4tY/F1CYL1QPsSiNG5IM9DR0S6PxWPKFMOzQShh3VkPevLxaGe55aMVWSBDoBowKGEBCqeeKW09CA1CSvzZcVj8kjVErA1vAdzpoEEXOeEQF3awTNXrqax+pMJwERFDFJfi6qBUVEBPtaskZ56Kx7FrP2OBHk9ZKtvi8jxl2vz24rK+ldFwqASboLFvlcXgeba7k81dDvyvbrJDEE9I/9BZFTJnhtRJtAZWTHTGQ1GD4tPl7ItGWgD29f2KOWtasmjdl1vrSoV/UoC1xPaGGXBR/kjK+USw/H+nDcTHsXMb5vpbkwE14OzZhbtT+2x9rPL6mqsy50G4zCEcEHP1v6qDfF9U/Olu5VwbOTmf8Vca7mUb0+Uw7x66cBjHfhnHoH3W1dPzOcMKS1CNpJjf0Y+ZmkWi9vziOkb/yUCblJmWPxQ6eh5XQA5KhmTbFGH9EQVyt6lGWEAcnKygQOha7/GUFsrh15Ge+OAicVg/i6IYUNxCdNnArzXhEd+oWyNQ12B8FII51khRr0uQnsd+Mvf5t83PFdG//f4as3pyyXaOfzi8uKWk4NNZ9NKIJqfdQpNEWSAmP1VKaMAP3b9yl+YR6bxolP2e1XgA2ywZwfwm+6h6aJv4zec0sgjV7zYJV88bi+/2fpjJJ6Cy3Jo7NoUiF8Z/PvHhOsP5oKM4w+F0hrqigH/55uCQBBjNtWn9kmWjvffwtYfY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d41040-36e3-470a-a5dd-08db246d9cc3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 09:22:20.8471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMUlFtOf56+3MHlA3ppKj0t9RpwQWgZu0BvCdjb0veUKYxMscufeFOdbTGu6Xol57dONeokf9ZSPZMHXTKpGxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5764

On Mon, Mar 13, 2023 at 05:55:09PM +0100, Jan Beulich wrote:
> On 13.03.2023 13:16, Roger Pau Monne wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -1232,9 +1232,8 @@ The usage of gnttab v2 is not security supported on ARM platforms.
> >  
> >  > Can be modified at runtime
> >  
> > -Specify the maximum number of frames which any domain may use as part
> > -of its grant table. This value is an upper boundary of the per-domain
> > -value settable via Xen tools.
> > +Specify the default maximum number of frames which any domain may use as part
> > +of its grant table unless a different value is specified at domain creation.
> >  
> >  Dom0 is using this value for sizing its grant table.
> 
> dom0less DomU-s do as well, at the very least, also ...
> 
> > @@ -1245,9 +1244,10 @@ Dom0 is using this value for sizing its grant table.
> >  
> >  > Can be modified at runtime
> >  
> > -Specify the maximum number of frames to use as part of a domains
> > -maptrack array. This value is an upper boundary of the per-domain
> > -value settable via Xen tools.
> > +Specify the default maximum number of frames to use as part of a domains
> > +maptrack array unless a different value is specified at domain creation.
> > +
> > +Dom0 is using this value for sizing its maptrack array.
> 
> ... here. And even ordinary DomU-s appear to default to that in the
> absence of a specific value in the guest config. IOW at the very least
> the info you add should not be misleading. Better would be if the pre-
> existing info was adjusted at the same time.

Aren't domUs already clearly covered by the sentence:

"Specify the default maximum number of frames to use as part of a domains..."

IMO dom0 needs to be explicitly mentioned because in that case the
value provided is not the one used by default, but rather the one that
gets used.

> I also wonder about the specific wording down here: While the max grant
> table size can indeed be queried, this isn't the case for the maptrack
> array. A domain also doesn't need to know its size, so maybe "This value
> is used to size all domains' maptrack arrays, unless overridden by their
> guest config"?

I think the wording I've added already conveys this meaning:

"Specify the default maximum number of frames to use as part of a domains
maptrack array unless a different value is specified at domain creation."

> > --- a/xen/common/grant_table.c
> > +++ b/xen/common/grant_table.c
> > @@ -1956,18 +1956,15 @@ int grant_table_init(struct domain *d, int max_grant_frames,
> >          return -EINVAL;
> >      }
> >  
> > -    /* Default to maximum value if no value was specified */
> > +    /* Apply defaults if no value was specified */
> >      if ( max_grant_frames < 0 )
> >          max_grant_frames = opt_max_grant_frames;
> >      if ( max_maptrack_frames < 0 )
> >          max_maptrack_frames = opt_max_maptrack_frames;
> >  
> > -    if ( max_grant_frames < INITIAL_NR_GRANT_FRAMES ||
> > -         max_grant_frames > opt_max_grant_frames ||
> > -         max_maptrack_frames > opt_max_maptrack_frames )
> > +    if ( max_grant_frames < INITIAL_NR_GRANT_FRAMES )
> >      {
> > -        dprintk(XENLOG_INFO, "Bad grant table sizes: grant %u, maptrack %u\n",
> > -                max_grant_frames, max_maptrack_frames);
> > +        dprintk(XENLOG_INFO, "Bad grant table size %u\n", max_grant_frames);
> >          return -EINVAL;
> >      }
> 
> I think I agree with the relaxation done here, but I also think this not
> introducing security concerns wants spelling out in the description: My
> understanding is that even in disaggregated environments we assume only
> fully privileged entities can create domains.

Yes, that's my understanding, as domain creation can only be done by
privileged domains.  Of course when using a custom XSM policy
the permissions can be changed, but it's then the job of the user to
asses the security implications in that case, and there are existing
paths to cause resource exhausting when having access to the domain
create hypercall. I can add:

"The relaxation in the logic for the maximum size of the grant and
maptrack table sizes doesn't change the fact that domain creation
hypercall can cause resource exhausting, so disaggregated setups
should take it into account."

But domain creation for example also allows creating a domain that has
MSR relaxed, at which point it could also be vulnerable to other
issues.

Thanks, Roger.

