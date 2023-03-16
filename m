Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803976BD562
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510706.788900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqKF-0003eV-Ns; Thu, 16 Mar 2023 16:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510706.788900; Thu, 16 Mar 2023 16:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqKF-0003bf-Kp; Thu, 16 Mar 2023 16:19:35 +0000
Received: by outflank-mailman (input) for mailman id 510706;
 Thu, 16 Mar 2023 16:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcqKE-0003bZ-BM
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:19:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5321949a-c416-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 17:19:29 +0100 (CET)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 12:19:27 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6455.namprd03.prod.outlook.com (2603:10b6:a03:38d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 16:19:21 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 16:19:21 +0000
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
X-Inumbo-ID: 5321949a-c416-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678983571;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PYuDJ6xd2RaMZQ1RdIAuw0x3emonANBB5ZgFniGDfQc=;
  b=RTUZvOKcqS4ojD31PiYrTgaJRLiP/DlH9k/qOwR/LqJqkdbEPTxk/iS+
   fB01NVEUPiLYASCShkPCGOePgJtQBHJnm71m5E20UpGtU0L7aeF5QDTB2
   U4/dN1P3u/stCvr+BQjIdiWdcY4FRD44I/7oNvJNyX33tIxXN7g2osh12
   s=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 101056689
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:a0oCVq9tHnAW1nONpR5/DrUDYn+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jdLCjqBa/yIN2v8Ldp2a9i28BgA75/dx4IySFZo/3o8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkV5AC2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkliy
 /UqcAw8cCvduL6K5L6aY/lcuOg8eZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUuitABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXxHumBtxCRdVU8NZAvl7P2XBIBSZJdlyFj+OV0HKaX9R2f
 hl8Fi0G6PJaGFaQZuf6Wxq0sXuVpCk2UtBbE/A5wAyVw6+S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTG4NDURLGQCTTQZVgZD6N7myKkxkxbOQ9BLAKOzyNrvFlnY2
 CuWpSIzg7ESi88j1Kih+13DxTW2qfDhUQod9gjRGGW/4WtEiJWNYoWp7R3Q6q9GJYPAF12Z5
 iFbwY6Z8fwECoyLmGqVWuIREbq15vGDdjrBnVpoGJpn/DOok5K+Qb1tDPhFDB8BGq45lfXBO
 Sc/ZSs5CEdvAUaX
IronPort-HdrOrdr: A9a23:FLoUmatzu1+FeVIzl8ch35hX7skDctV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoQZPwJk80l6QU3WBhB9aftWDd0QPDQb2KhrGSoAEIdReOk9J15O
 NNdLV/Fc21LXUSt7ef3OBgKadD/OW6
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101056689"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oR5xutBHJ0mFE2640Bce6GREINtr2LjmKo6UNRbM1fcUlFBVPUn4J+G0G7alta4WNhOiDMqUeLKTzH2hikZhnGptIL98tcGxbFos8U9iRtqj1gv8zlgQOW0opaN4rBEfYIl/0WCKpv8C1R+pF+NnaVNhRxtZnAw+QKDHd42KARblHEb/rcFYH4lcT2cufohjFAFvnIg18LeoTCCSyaMyZGRLzNnJW1aqxdmVauwK8WR6TKe+saGjpvH7c7j5xLJpskn5dIX4JaLwhlQ8HxhdeTiXU67uOnpLw63xxaiDClw6rIgoQI63gkzOSn2DB1EQ6aCv3aJxiLv4cltFYD+Vdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJRdktpNfP/hPtrS7zLScKntJ5YCXTuw/OzOXfVVNkU=;
 b=eCFPilRLz+YOuxhYahV+h5vIwZ27Q37FgAB7h+84oKE4t/FYUByTbWbH5yHsepA+pYNw2TOzgbFPEgY/eOuqc0aPXFEo69V3W5b/pxI/cqLRMbJsH1ce9HpqltOY5+sJDfdIDflpc5Y9Xf4Y5Dti8TqStgcjPjlMh8oPImYWq8ZlcCoTBwXgZyNdKCZXI5Bk04GNJ1OOIl4r/rY6abz1oTVWKnHF887H2h9x0eLGW7yr2vIRVHW3sXG83Lw0r+VWsmiGbJgbxfisOTZeAfifZFXiYTxJvaGSaRnfUUNkuxCfNrIqcOsEG+1BDdcX371WkbTTgJwqZH7RPdeVrG/7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJRdktpNfP/hPtrS7zLScKntJ5YCXTuw/OzOXfVVNkU=;
 b=SemF9eIj3ivkbhFfbG8r8B9NFGrZ9LxX/EhIGKSYpCYfcZd1Ge+2rDDZKKOlcOll584rwshOf6ndcxCBTTNhrcXi7+Xf09QRkR9ANOpfgCjZlpvoFZf0ePGJtX7R81/F2fo8tYS3B0/aAVsWy5RFJFy69dmQW23dpuyYK9dBpAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 17:19:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Message-ID: <ZBNBhS2I4XWkwXr0@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: BN9P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 060debd6-a2d4-4596-de41-08db263a3333
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IUpaLJ5whBbCXLX438O7jxB6G0iOqUrMHVpRx5Y4RB7Q1Q5r82CaSeKGlC1ht4BC62u/pKAyLyh2y4L7J9k6wmvTVtZGmjKpUGFiKYKlWwOfCYaFvVnyL8+VRq3rlnApvMmCfPnfn0B85B1E4g29YwMbp6YEO0b1F3yV+XluGjlF9DUZcbqzzBmQXOY3k65ung0Ing0654tI9of2hQcnPmuBNQ7IWZ7f2UHq/UTjxsU8CjwZUnXSVOKIOh6fE/B7mPTrQdI8jeqBcDSj9VvMxaYyvHlhknbmN5BCIOaHzmcJ5GWb9uMzKfJoxPnIakDyZu4v3XYGD1Nv/sbisLKjWRC8qvWRyzbv3mW0VcXVOzdoPa3rx7uZLwXnJuetZNSGEUojRGEox7KPG0jJC1WUlW4OXA/amKYFuaFwGuCUsGX3G8eMvHKQFMohk9I+ZgJdB1lBxiPxWQvvyK1GqkeP1575GoaJWQbLEMi9D2UQ5ktLEsWRGwzxAH/8B1cWYkdq31g9a8CACqCdqtvCB8PQxU2AH9XgJDQGJPmRkK7yiRMaZEUC6tcJH4Qo3yIbx0vUdW7uxZi2iRh5RxSlhQL2osxkUdOme55iRu+gzmXiDm/Z+pYDQ8PNcrvoyFwBHhHGcrwHjz2+myaYl4IR9eaqcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199018)(6486002)(6506007)(2906002)(33716001)(83380400001)(82960400001)(6666004)(85182001)(26005)(9686003)(8936002)(41300700001)(5660300002)(86362001)(66946007)(8676002)(66476007)(6512007)(66556008)(6916009)(4326008)(186003)(54906003)(478600001)(316002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVZ4K3R2YVVkRksvR0lXSkcxc2ZmRElCTHh3RHNITm9kYmNoejdRa21VMGpZ?=
 =?utf-8?B?Q2tvRkEyVDJLaTQvUlZTZS9pZUY5VGVxYnorZkhCb0M1aG8rVmtWSzc3V1Nu?=
 =?utf-8?B?ZVF6bmRwTW1xNXZ4bHozaUlUcVZJcmplMHQ3bml6dDAwZjFFU0dYbS90eHcx?=
 =?utf-8?B?VlVRRUNsRzBCNmZNRHQyQ0FCbXlwV2JEUmNKd0dKb3BxeFQ3blNhMzRtSEF6?=
 =?utf-8?B?MVpQVEtyamVRczFCbitSekR1eXpPQXBQVGM4YkFRb2pBT2NVSGJPZkE5b3Ux?=
 =?utf-8?B?ODhhRVZuQzVwa0doVXhaSVNuNElxZnNYdml4dTduUm4rY3JvbkRpRnpvUXZ0?=
 =?utf-8?B?Q1lyRFlMQXVIN3BwNlVTMlJJc3B3STEya2dsOUtRKytPOVBWVHViYk1abFJT?=
 =?utf-8?B?NkVualRRdFV1NG5YTWZIeFJKMm9KdVNOdG1saGFXN1ovWnF0dXlWclVyM2cv?=
 =?utf-8?B?c1IybGdRWkxCekU0Sk0xYW5ONGRmUFA5eHhWQnJOUEYyaGZpVHlxZHJTdE5m?=
 =?utf-8?B?aysxQjgxaFd1TnRUNlJWdXdHQUYzaVFwcHNZOENic21zNG1jUzYweitORHI1?=
 =?utf-8?B?bjNsYUMybUVZQS92eUtyZ1VoRUxNbENtM2gzSTlzWEgxVjFMRVFVOWppb25R?=
 =?utf-8?B?ODZhYUt6RGhvOFB0TUNZWDVlbjUzRTRrR0VCV3FydmVtMksvaDhiV1AxR1FW?=
 =?utf-8?B?VG9wSHp0ckl1SE83UFltbFlwdG12ckVWNlB5eERXLzk5U0FkWERJU2RrQlpX?=
 =?utf-8?B?OGtHUkREUk5oZ3hrb0FlemhZYUszTmlsbUlLSU9LT3R2UThvMUsvT21PMGdR?=
 =?utf-8?B?MGlQcUhFRXNSTEQzQ3JIL3FmVGN0NnpoN3pQY3ZpdG5pSTZYWHEweE9JSDNW?=
 =?utf-8?B?YTU4NFlLNVBZV0FzRFBuNWhkMHBmNG45REMxTkVYdXU1NXg5U2JXNDBZaU02?=
 =?utf-8?B?SEZjakVGQTJ6ZVNPZWtNeWp0aUl5V0F2Z2ZSV0t0UXBSdFRpTFkycTJUSFVh?=
 =?utf-8?B?MmVQNmNubHZtSTZYSE5BNHdOUXJXWllJdFJXRnhMUTV4eHpsV0EwNDFMQjR4?=
 =?utf-8?B?M2g0bjN6Rm45c01BMEtDTTVhRUtDOEZhZ2dhVnBkaG9OcERrK2dER0N3bGdT?=
 =?utf-8?B?NFVpaU80anMrVnF1dnV2dW1NZDdXQ0pjSzhIbEh6MExKUlNmcWEyUmxoWEJK?=
 =?utf-8?B?RDlqU3N3dkNQOWNWZkpmbWVGUTBXVUl0VE9tNDhkQWZ3UjViRUtiVmFLeUV5?=
 =?utf-8?B?R1VlcXdMSXhsQ0l5NGpaSmM0a24yVG40eFBvSVZ2THExL25CeXhlWTd4NHcx?=
 =?utf-8?B?STdSa3F5MThPb0dHK1FkNjJmUjlhU2Q2WWZFdzlocU9pQXRpanpzNkVnSUZ4?=
 =?utf-8?B?VldVdkFFZ2RaK21IQ3dubWhVRVoydkxIaXpVRjBWZHQ2QkVyU0E4M3c1d0VF?=
 =?utf-8?B?V1MxaU0vRHpjN1d6aTdJTUUzVTRFVTdNaDh0R3l3V2g1clZvK1c1a2VUYkhm?=
 =?utf-8?B?WXFQRzNURk1MdmxPQnZCS0NnL1R4c1Urd3BrY3hlWEZDOVJwSHZPeU0zekdh?=
 =?utf-8?B?NUxQSzZRUUljR2FWazdST1Q3ektWeXB0VEVLZGo0UlNwY1BjY0dDZHBPcEpO?=
 =?utf-8?B?dHY5K2NOTlpDbGs2aDc2dElaaXIzN0FzY205VDhOZUFjK0U0bk4rdzZEdkxL?=
 =?utf-8?B?UjRocDZtbUhXTVJRQzJEcUgxN0E2TzlhdlRyRFRCZVRkSVFkMnFmT1BkV0I0?=
 =?utf-8?B?N3IxT0x2d2dwUXhXamVlNFJORENYUEY5MGd0NWRoRUVJemhVNFRkMVM1V3ZC?=
 =?utf-8?B?TTZhN21JQWNCcmxrWmZXdUw2OUlIblk3dHpxZFBQM0pvN0hLU1VaQUxYdGxy?=
 =?utf-8?B?TFhCZFhtVVRoZFBURjJzelVycTFJOU1LRkVhUGJBNlhGcStFbnppVmFRZ0h3?=
 =?utf-8?B?NjRmdmp6YVFWQnhuKzF3eUJIWjJpemwxVXJGODlxS3pyRytSZmhiZUcwZm51?=
 =?utf-8?B?ZXJzaFVFV0lBcHU5d1pvYUw1UkZwUE4xQ1ZxVXJQU3VMODFUTThSbmdZNkti?=
 =?utf-8?B?WGZtSkMyYkpFc3Ryd0JlSlJqUmwxclYzendTbWU1WWtPV2tkOWhRSncxNFZC?=
 =?utf-8?B?c281QkltaUJlbjkzd2tWeVd4WEt5WHJ2a09iN3g3T3hRTWI4TlJtdEFCZkQ3?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TxVoVZhJTv4W1fQ5CnBEYOYbnXqpo/+VPz5jrvfPS7yBUyaT80FJSa8fgYpAE8cPdGrvP4019H7zFtUOhi6i2qwJwCCVMg2G6ooCtPxIvO5sJPIE0LYziZEvC7Fe4qBGmBV9choHnWoO7lJsZLG+iX6dGYbT6Pom+Ogzjd+ggelxo8rdfVRHg9vrI43uEyd3fpOvvTL5l+4nGqb9Jcdh/SDUxlpApwpnYz0TfLXPnxc8KyO134EVvukkhPP+0WZ5uB5eOTce5yvmjURSfyN4RYgxHWvxZjQ+C4fGWkH64Os1enIzUUUOcITO/S5dTXPMbWoutMmhFJAxe35klkWKK3b9q6GAsydB136YylYMPEKfk6gO6XmxXXA5akz02i6iQNyIQLb6cMIarlDwQ4xGl8u623zkuypUWI9ApnVroEDCqwK4qJs5F2KelTyohQgMYE+D/VOcHS2qyusGYQ2+zP2z6u3CFmg+CjelOAneTQjRsjwOomvU0NOLxWg0yar5FCzXsaNTE9dLplutvqUlIwtbMzdh6vIUM1qwZSWP3y5R62H+jNY4N6kFBxz2I5luPahNUvVraDr+RL35T1od/PcyUnGjpcrS2Smv9k1k66GUT3Vsa1d8A9q2wcJ75aWH2exSnKvzYaNahWI41YfkBTWzEsO/RfrnBw12Kdv9086yHKJF7VaLJOV5N2uCM3ncRMsbHLoOKHwBX5sfh7n4Z0u5emk4vm+FKuM8b1xWFGpIABAU7lWGWfdUi1qV0ueYKoOkJpYRqtF0kTwfiqrtfi8Ph/mXy9UplkkNMz/yEG9TicviklXOec+BjwA5J+oXkGVXIvExV3HEdRvCezdqhkwVDE3OKCYVaPdNx4oh+O8F2Sy7ynBeXhDP2ixz0aN4
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060debd6-a2d4-4596-de41-08db263a3333
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:19:21.5021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewMLxx00oOB9FhxeTWPHC9Mm3/4ja8ByHXJadnNFG0bctZa0o7tOcBVbYmnWnaSAmcCfsvYF5++eaaN3ojOSxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6455

On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> We can use reference counter to ease up object lifetime management.
> This patch adds very basic support for reference counters. refcnt
> should be used in the following way:
> 
> 1. Protected structure should have refcnt_t field
> 
> 2. This field should be initialized with refcnt_init() during object
> construction.
> 
> 3. If code holds a valid pointer to a structure/object it can increase
> refcount with refcnt_get(). No additional locking is required.
> 
> 4. Code should call refcnt_put() before dropping pointer to a
> protected structure. `destructor` is a call back function that should
> destruct object and free all resources, including structure protected
> itself. Destructor will be called if reference counter reaches zero.
> 
> 5. If code does not hold a valid pointer to a protected structure it
> should use other locking mechanism to obtain a pointer. For example,
> it should lock a list that hold protected objects.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> v3:
>   - moved in from another patch series
>   - used structure to encapsulate refcnt_t
>   - removed #ifndef NDEBUG in favor of just calling ASSERT
>   - added assertion to refcnt_put
>   - added saturation support: code catches overflow and underflow
>   - added EMACS magic at end of the file
>   - fixed formatting
> ---
>  xen/include/xen/refcnt.h | 59 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 xen/include/xen/refcnt.h
> 
> diff --git a/xen/include/xen/refcnt.h b/xen/include/xen/refcnt.h
> new file mode 100644
> index 0000000000..1ac05d927c
> --- /dev/null
> +++ b/xen/include/xen/refcnt.h
> @@ -0,0 +1,59 @@
> +#ifndef __XEN_REFCNT_H__
> +#define __XEN_REFCNT_H__
> +
> +#include <asm/atomic.h>
> +#include <asm/bug.h>
> +
> +#define REFCNT_SATURATED (INT_MIN / 2)
> +
> +typedef struct {
> +    atomic_t refcnt;
> +} refcnt_t;
> +
> +static inline void refcnt_init(refcnt_t *refcnt)
> +{
> +    atomic_set(&refcnt->refcnt, 1);
> +}
> +
> +static inline int refcnt_read(refcnt_t *refcnt)
> +{
> +    return atomic_read(&refcnt->refcnt);
> +}
> +
> +static inline void refcnt_get(refcnt_t *refcnt)
> +{
> +    int old = atomic_add_unless(&refcnt->refcnt, 1, 0);

Occurred to me while looking at the next patch:

Don't you also need to print a warning (and saturate the counter
maybe?) if old == 0, as that would imply the caller is attempting
to take a reference of an object that should be destroyed? IOW: it
would point to some kind of memory leak.

Thanks, Roger.

