Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC66BB8CF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 16:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510133.787292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcTVq-0007UY-8d; Wed, 15 Mar 2023 15:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510133.787292; Wed, 15 Mar 2023 15:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcTVq-0007Rq-5T; Wed, 15 Mar 2023 15:58:02 +0000
Received: by outflank-mailman (input) for mailman id 510133;
 Wed, 15 Mar 2023 15:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVd2=7H=citrix.com=prvs=431d4e183=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcTVo-0007Rg-5A
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 15:58:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26993273-c34a-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 16:57:57 +0100 (CET)
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 11:57:54 -0400
Received: from PH0PR03MB6368.namprd03.prod.outlook.com (2603:10b6:510:aa::21)
 by MW4PR03MB6601.namprd03.prod.outlook.com (2603:10b6:303:128::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 15:57:51 +0000
Received: from PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034]) by PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034%5]) with mapi id 15.20.6178.019; Wed, 15 Mar 2023
 15:57:51 +0000
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
X-Inumbo-ID: 26993273-c34a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678895877;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OwhCYK1gRrzn2CuBP66qU82Zzcyy22zWYYalHCPNlnY=;
  b=cZdF+YQ2ymCO2a/bOQnf/EOHpT8aklF8hQIOIggTEfrRFx7lYjo0ECjr
   ypZ2X0vgUTHm6JLbZ3J0fDz8XTrTUa6lCIo/sEzL9o62w26HbaKaRqngb
   rBdIFzmjn42mizo7xPT7tMJBtv0LwJwljEXcuJemyJjLNaWtLf0trXPM4
   g=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 100982988
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JgbQi6+tNs7WmaWhUsqeDrUD7n6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WceDGGPOfffNzemKtojboqw9EpTvpOEyYQxT1RqqCA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklc/
 NkAJgoycCu9oMe34u2gQdZpu8E8eZyD0IM34hmMzBn/JNN+G9X4ZfyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilAsuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eXzHOhCdJCfFG+3sU13EKDnHIQMk09b0aQ/7qL1Re7Yt0Kf
 iT4/QJr98De7neDVNDsGR2lqXiLlhcZV5xbFOhSwAOHx7fQ4g2ZLnMZVTMHY9sj3OctXiAj3
 FKNm9LvBBRsvaeTRHbb8a2bxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdMTj0z
 iCDqiQznfMfgNMA16ih1VnCj3SnoZ2hZgU1/ATMQmOs6EV6Y4OjZoOA4F3Xq/1HKe6xdUWMo
 3Eeh46+7eQCAJuXnSqBaOwIEPei4PPtGDfBm0xmG54t8Cuk03GmdIFUpjp5IS9BMsECdjvkY
 RaVuR5Y4pB7NX6mK6RwZuqZCdkuzKGmB9TsUP/8Z99CJJN2cWev3iB3ZEeWmUvtnU4EmKQzf
 5ycdK6R4W0yDK1myH+tQb4b2LpznCQmnzuPGNb80git1qeYaDiNU7AZPVCSb+c/qqSZvAHS9
 NUZPMyPo/lCbNDDjuDs2dZ7BTg3wbITXPgad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:H0FJlqhRgTtDEcxtAeeaLcvTYnBQXiwji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPk3I/OrrBEDuexzhHPJOj7X5eI3SPjUO21HYS72Kj7GSoAEIcheWnoJgPO
 VbAs1D4bXLZmSS5vyKhDVQfexA/DGGmprY+ts3zR1WPH9Xg3cL1XYJNu6ZeHcGNDWvHfACZe
 OhDlIsnUvcRZwQBP7LfkUtbqz4iPDgsonpWhICDw5P0njzsdv5gISKaCRxx30lIkly/Ys=
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="100982988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lt1G0FAccYGZlCM4odROC8SR0aSErAcu/AcFlm4QHdFi7lgiEleHkUQmJTvq2RSiHpJg5Gcu2ckyyHYOL0PnBPxLvH35ORAduVcfRxwTjdKGjrHM5a/pcFc63issf8Mzmr4xqw5bdpkwUWA3Qlhelj4EKF47xF4Dss8ltPdNd7oB6RDSFpjdlouUATN0qblE0DMlAxGwVLD2lEI3b67BnoS6psHOUHOEXCqGqUN2d3tvgNfeKYl/DsbH+xYqcQWXmQj9JY2g8zxK4yxWw4XFAQsfU7xg84RyPIzvcqQFYzgH5sZ3E+2++4eYU2Mc2grnAP0s8tnpMnhe0p78QK4DDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsYSFHUasSuNuC26UpMbcWO9DLN9A8a3twVVvPb95Ks=;
 b=PWBldA1kcwOHQAjEPIL3UFEgI6n/LPazVP9JWFZU3CGUchC28oNSankcp5m0LPEKPjQc+KBQ9d3/JLKsjLR9a8588ViApL7Vqo4PLvvYHliveUJ4K5iekI7Vpr1Gg2LFDI5YFrqBukp1wflsG7WtNncDxG5Il9nLPkV/pPMxu5AVR9a/69awPeb02i0aagTj/fg8qvwY/2DGcoZGmbBrpUvw0RgwxkYRGOHoz7bl+b4dSR8hJMcI1svwJ6ilHWpCyXiq9CA0ni8BlQfQ37BMfH+wIQvHmWgSkoCsfTbHNGXs4EVdIRORTZJYln3QFmStpscAexDB0gL1oxZK6LY/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsYSFHUasSuNuC26UpMbcWO9DLN9A8a3twVVvPb95Ks=;
 b=BhuI0nd2XpcxSQM/nDvlycZg/8QuFNHdE7UGCpVZYEUlq1HyTX4duwbz7SJt6RTh1iG1FBN56X1pthDKF0HhpQsKjqw3jHiFXxt8DHk/97QEHMsshpg/aYsOpcVrPpbaNf8GApi62EhnIi2kcqVQYBZ/yJ/jZEZvOD41h/1RDX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 15 Mar 2023 16:57:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Huang Rui <ray.huang@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 3/6] x86/pvh: shouldn't check pirq flag when map
 pirq in PVH
Message-ID: <ZBHq+UeK/lBj3s8l@Air-de-Roger>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-4-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230312075455.450187-4-ray.huang@amd.com>
X-ClientProxiedBy: LO4P302CA0031.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::18) To PH0PR03MB6368.namprd03.prod.outlook.com
 (2603:10b6:510:aa::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6368:EE_|MW4PR03MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4ebd28-f068-4f77-36ea-08db256e07d7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N+n4UHsbROHFufmqjVnhmSp8a7j1wjdd//a3/BXdkyvJoj1+TAeT0T8ItxoBVwZQYCLEgVaBznidzNkJxpJLL1Af7JDZYNqxY6VUe2a2OqTGRtsHYTrJkqpYUZeobvQ/may+UPkvKrzjiQc8LhwooCJ+9HcB1uFmAkxW5Qrlql1XVLmV8bvKeytQoUfI2/c90haY2lMvDgsC2eYdhhoduut7mugd1os7g190AE+zqtfskD9oEbnNG141RiUzNCPM5TQpguSpDEfzaQ/UD5gG8v7wOU4XZ3Q5fi/wLwD9aapM9EP5PmA3YfhcyyWPD4UJASOkkA8stYYvk9bgHFeg5UvITLkZH0VXlqHntBoW4JL/cHxkKJRQ1H2aP+GOQqjyDnzldL7zKDOFce//7gWr6KVLjzmDdwhvFjWWhwLLjOZ2/b+HVT0VkiXXK8ABfovPNO5DestHvY7VozONbxxRiVvAfuy4xOzHANVNOwC+KQ6haPgGNzIj2bCN368xL118V6l/Tzs4kDvWkZjP5L9rNhi2nN0nVyrpqoYhr7HTra6kNgfJRo4bdnj5d8+yPJ8Obb4blIMldyVOhn2275QGCjnpgeMGULQoGfyi4z91lVzbuPVx9fsfYiT6r/nviUJHTTNT8ZI/JP5YlLkJZglCow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6368.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199018)(82960400001)(38100700002)(86362001)(41300700001)(85182001)(5660300002)(2906002)(7416002)(8936002)(4326008)(6512007)(6666004)(33716001)(26005)(186003)(316002)(83380400001)(6506007)(9686003)(54906003)(66946007)(66556008)(8676002)(6916009)(478600001)(66476007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHByTnEyMjFzOVhnT0h1Rmd2THh4d3dSaXNsRUJhbnBUSVplMFV1dXJTdjkv?=
 =?utf-8?B?dXpQRWNtNDdSMDFWQ3FyL2FOMml6WUxMSUhsQlZGWG16d2hKUnVhYUtFeGFN?=
 =?utf-8?B?bEF3elJ5RGZUZGFWQWVZTmxGeGc4d1dObVlERWRYZUJGOWk3TmN1THB6OXhi?=
 =?utf-8?B?bnNLd1A3R04xbU1kaTdSNTBKZ3VRa1kwODM3TGFhZnJWZHpITU83V00rRmVJ?=
 =?utf-8?B?U1c2VzdXM2o5aWpGTmNOTjRYU2VZd3BiTlZtK0ZsNW5sZG9rWERnaysvNHp6?=
 =?utf-8?B?cHEyOGNvNzd3VXlnSjZNSll2WXdid3dyZ1pqd0tGM1lmRFIybENyUTV4cFNP?=
 =?utf-8?B?amtuR1lQQ0ROYldEa1RoNFRqSjVCbnVuRDNNaXdGMmtBYlZEd3VGMkMyTzl2?=
 =?utf-8?B?ZjdPQjBlMjJPZ2NUU3NXSCtDTWdYVUE2RVNFZjFOWUhITW5sT2FQWUhZUkVl?=
 =?utf-8?B?bHBUemxlVWttY1NBWm9UYWcvNFZmRDNqTml5UTBqZ1BHUmVraWRhZmFYVWZS?=
 =?utf-8?B?RXE4TTJLNHRnZzRwV0g1dkNCaG1UdWVNQ2tzZ0M5Vjh5UkZCdlQyclR5bmRL?=
 =?utf-8?B?MkhYUDBDMUg4ck52VkNaa0dPMHpCYmZRMkVOMXNUWVc1OXIwa3lHSVJ3Q2Rx?=
 =?utf-8?B?T1ZhVmc5M296OVhJZ1JPbUxZK1FnTTNNN2NDWTdhd0NFQ2hkVnJXZFZ0N3cr?=
 =?utf-8?B?aE9xWHp6eEx2ZGJMMzNNOWE2MDBLZzBlQjAwQnFTeStrcEQ1eGZod0Exc2tj?=
 =?utf-8?B?ZG9LTnQrcldHa3BncjIwcXFGUnphZ1JCQkNxRWpoRHlrTGlGZTFoZ1ZYS1J4?=
 =?utf-8?B?S05mNmJ4WHpQeEVhbUR2d2RPeGRLUHJyTys3TGhwbUYyZ3lVbXQzWU0zSFN0?=
 =?utf-8?B?dDVzK1htaEFEMitZaW5JdHRrZmEzYmNBamw2M09JSWhmeExDbTJzWHZocXJR?=
 =?utf-8?B?MTc0K0s1dUdrLzhycnJ5L3VTeHhPNnoxTnJmOEF1N3pyYWYxODcwS3JxUkZm?=
 =?utf-8?B?ZWkvdHlqY3ZuMzlBMXV1amxHd0N6YnZwU0MzYjRudlpLbjlxeWdkbU14ZWRR?=
 =?utf-8?B?azVLUXJHM3kzVG9GcERJNEgySG5OaG9SQW9vaGFCRmhkWUxXYnRBRENWOTZS?=
 =?utf-8?B?cG9nY0dxZmpCbmZVTGZoNk95cFpVTFZDaHRwL3lNRk9Jd2Y3alhQN3MrMEJx?=
 =?utf-8?B?OXMxSUwyajkrbE9idDh2TnZ4MWRmbWUrb0Fqbm5XUzJLQ2RIclFhRnJUZjVp?=
 =?utf-8?B?aklFcGRvN2Z4a3dnYmY0WW94UFFTYUlHZXNNSFZoZ0dGTnZGRjA4bDlRN2pz?=
 =?utf-8?B?UEVMTGh4UldoWnZUNGxVTDVIVEtQcktjT0xJQWl0bExjN0JKZHZHSkYvWG82?=
 =?utf-8?B?T0RucXROa0Q1ZHM5TEJGdFI1NFE0K0xDQmswWFJuQUUyTS9mYzRIancxSUVq?=
 =?utf-8?B?bzIvY2w2bmQvdzEzTFBkOUN4NjhCQzdEdlM0U2Fkc2hFTzg3RTNsbG4wZlN4?=
 =?utf-8?B?bnFpY0tMZ2xneGZjeWRuY2cvb3U3UFlxcHJUMmZFeFIrWmJQZGtZSFk4SmF2?=
 =?utf-8?B?WSs0TWpOUFBpZmo4VmVGYTlud1RjcWM4MkMyMjRvZVhzcWxYc3JwSkFpQnIx?=
 =?utf-8?B?RVNiU1AvelhNR2dvZ3E3dGhKdG9lRzdiOUsvd0tQbmpDOWE5WDBrWFZubStD?=
 =?utf-8?B?R3ZRaUhHRG9NZWc3NDVkNEZHZGJScjRzN08yblc4ODVoenBWOXNFblBFMGZV?=
 =?utf-8?B?WW1xQU5iYzFrUFBCbzdWUXRhMjJzdTFYZWd3QlRkZkYzYVA2TktseEt4S2ZV?=
 =?utf-8?B?MnpRY2d2OE1VTGsrUHJkclE5eHBjOEh4UHlJM0RuUmRVTjBNRTl2MDNsendM?=
 =?utf-8?B?Vk5YS1dNTHBQUGlCWUZKbDBEQnZyNHprKzdsQVZycVhZWFVyNEoyRlk0TDFi?=
 =?utf-8?B?ZGFGNlo3TUVoUUlheEVnWERyU0lmdlBjNm5xNFZGbk1xcXNWQWZTZUZLZUxz?=
 =?utf-8?B?clZ5OXlxZGFTMHZ3aGhiczNkYlIxVnVBSVpKZlBaOHIwOVQycWFkd2RTaWxK?=
 =?utf-8?B?eHZBSEdmK2cxVWxHNWhLMW9lczR0RWYweVZ5Mm8yMVNLbm9UR2hwU1B4YlZh?=
 =?utf-8?B?d2RCVXJjbzVxZ3dvU09TeDFVckNOaXhMTjJ0Szl5dFJHa05Fa2V1WnlnbTBS?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+07iL829Pb4DjnO0iXYrQPo0svkGSVYZcz6O9Bh/V12Qm7RQgnmsqnneTQcEPs5n0LMubJDMZ9lH3hh+vuLwxWWvWT7akAbtIuHbLs790aCyCDoVrbjByY3FhlJFWYFKbVYD+lzyv35svigT3sc3miktVEzI4c4+sqcnlqb7eoUUYoH2tQQ1DZxSemBUZR/F041F7nxh4ifaZkgZqZzzB+12wgi9IFlLRaEwMKZaQS1cE42Syod2C8VDI94TnkJY2ZkJG7XAaW0Xl4iVQlJ8EgN+kZzqt76pwPa3Ed/oXhfAIhMvCbHbn2trym/7aWCL0zfYTm88GMrZHWUfX+NbPjy2uDGIgzR4/nHlfoZBa2suj6MfVs5zgYt9AuW+LxJh8fENq4mLZdEIsKxyxDsDfCxngWh4DrryoY/H/dBfAHkE8W3AcVBXusEaB8pdcmNw8DkuMiV+Z3Kf+Xf4Eqx0zEJdUGdZhHd3A+7oHpr5pxuvrY/fHS7FDRyACkJoiRgmutly8UUskzi7xtfTbVG7RWWfbxwq8Es4dZlB/XpIpIahiZojJ5BS7YjmrBqQGmanQ593WVu1W9vuqX2xDAQzJmg8J2fIUE5xp/5JfBI9VLzgMB5y2ybsMSJuiNvRuukoJPm0ICDK749fhOwSDil4VKwSkvwR2h2a8k7ymPa3dkKpmSLNx+FMvn9vM1IUrUdOKibxvrqQhUcanP4LV5Uaz1+76Ku7XGfebdpuBleZgOallweNXXBtW7R0+NWBVynvclOp8j2gj8SUBKpq5d+Lt7NxTYxg5pXMl3z0fS69bZj7H3vfCit85GSmArOQO+bqvxcILNFOPLlDxDM8Uzx4jtFbhWF4R0x9U8PuJWCnR7En+enoWvBE+enc2awnZBzc
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4ebd28-f068-4f77-36ea-08db256e07d7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 15:57:51.4356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiVfAdPW7jVPScTKrWQg25c1+3rdon5TKk3ygGT8EnsQ8T+iNy4XKn10B+ErgYTRmkGXtjq2E8SG8ViAv4uY9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6601

On Sun, Mar 12, 2023 at 03:54:52PM +0800, Huang Rui wrote:
> From: Chen Jiqian <Jiqian.Chen@amd.com>
> 
> PVH is also hvm type domain, but PVH hasn't X86_EMU_USE_PIRQ
> flag. So, when dom0 is PVH and call PHYSDEVOP_map_pirq, it
> will fail at check has_pirq();
> 
> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  xen/arch/x86/hvm/hypercall.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 405d0a95af..16a2f5c0b3 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -89,8 +89,6 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_eoi:
>      case PHYSDEVOP_irq_status_query:
>      case PHYSDEVOP_get_free_pirq:
> -        if ( !has_pirq(currd) )
> -            return -ENOSYS;

Since I've taken a look at the Linux side of this, it seems like you
need PHYSDEVOP_map_pirq and PHYSDEVOP_setup_gsi, but the later is not
in this list because has never been available to HVM type guests.

I would like to better understand the usage by PVH dom0 for GSI
passthrough before deciding on what to do here.  IIRC QEMU also uses
PHYSDEVOP_{un,}map_pirq in order to allocate MSI(-X) interrupts.

Thanks, Roger.

