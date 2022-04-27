Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A96511814
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 14:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315007.533321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhEE-0007uB-HC; Wed, 27 Apr 2022 12:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315007.533321; Wed, 27 Apr 2022 12:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhEE-0007ro-CK; Wed, 27 Apr 2022 12:57:10 +0000
Received: by outflank-mailman (input) for mailman id 315007;
 Wed, 27 Apr 2022 12:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njhED-0007ri-AK
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 12:57:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a985559-c629-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 14:57:08 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 08:57:05 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB2642.namprd03.prod.outlook.com (2603:10b6:404:5d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 27 Apr
 2022 12:57:03 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 12:57:03 +0000
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
X-Inumbo-ID: 8a985559-c629-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651064228;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6972KUR+YtcMrssGjSa81PZVKDNvm/yotEL+wE4r23s=;
  b=dYyYlE3SXF5NuhO/1iln/sJLELHY5+HiKCUpaRbDEsO0oAHTl0h5gelF
   nWwZ1iG8akqvWGg8Yq4QNPfTKCyOETFgxTG/7cNFvp6VXg5KkxPvcCtlq
   av/emUZwYAmtat3EQiW8nq9Xwup1zzHhzm9xxwKq1aifaM9F0GG/5IbX2
   o=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 70058907
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3KSc/q83xDh9bZui0rfBDrUD9H+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2EcXGnVaf/cZjPyL4olaIXko0MHu8TWmoU2SVBu+yw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YLmW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbORdjwHO4fco8YUVSF6MC1aD5Beo6CSdBBTseTLp6HHW13F5qw2SWsQYsgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHP2MvIcHtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGUA9QLE/fVfD277w1B6+rbRc/7pW8HaSf1b3RuVu
 DvG8DGsav0dHJnFodafyVqujOLSmSLwWKoJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvHiWzWorXjCuQQTM+e8CMU/4QCJj6DSvACQAzFcSiYbMYR58sgrWTYty
 1mF2cvzAiBiu6GUTnTb8aqIqTS1Om4eKmpqiTI4cDbpKuLL+Okb5i8jhP46eEJpprUZwQ3N/
 g0=
IronPort-HdrOrdr: A9a23:/2AfE64k3uYh/yceJQPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="70058907"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCW3EXQ/jw6rEd57P0ll3sfT52nRBZUX2gRIqgwU96mKlVBKyKZFlcdFfJZz8k+4vtPNQdyBHcbkLFCaRQcJrZEALjtK/6xyD6UR/76VD81ydmyd4hhuSKauBvE5ht8zWTx7lxjReMuM34i5VIf36gRrjiNUMwOxnBcwUDyAYPbHwPUuyI/Ow240SxfDxj7Th/xHKAc2CazQtTgbenO4b6sGo7obMWecd/UShQBwMY7Nb8/N26zmhO87WyUpAQVkevEfa0gHQA3zCtgzwXNvAzEnCvpNSZtSYVgiRNHNyONe+WPpLADqZ4/bGOb4NgkuglsvkhqLtzAd8GcQBa8e2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPym3AwOH2ncTK5Ie3FreRs99Y5iNMLjcxQqDldAgpw=;
 b=WT3XgJG56S2gWfY7ozE3cxVxYxKZQqjWAjTx6NPISY+WONd8I6CaGkgOpduQpYePjs1AYTHJvgjIAjArY80wArqBh4ouuymgjBVJBQcPbM68U/rH8hX2bggpRZZRJ5AIoF1KgyTk0ctQdnkIsxHe2FtYlNlDZUGooouyo8zN2IMz3BK662aUlaSoQqzK6aw4bMN9pHSHUzhEyY2soWj++WAl8v+LyR+JEbXuVBPt5qpn5EBUh2jNF1wrLvu17vQR2oK9sDdUphC5wbDbgmtpvsex2WDkoXuxHaZ4x21KmCCCkcZC1z1tI7CNF5k2AJkLSz42nUwRAp+LvvsBDcAyBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPym3AwOH2ncTK5Ie3FreRs99Y5iNMLjcxQqDldAgpw=;
 b=vigsqg/KSMmYhYqSY6s/5AIoA5/2j3rlmMmGLC1UnLt4Y20GJEtM4Sg87mL3XEEVOlLz60f8qICly2FGxiGPq9yOfn6B++VIusTXtY3IQ0JLXdT1jV2g0mU68i3XVNnKqpiYFVioL+JByw7T9f0lbjNL1NmZHj3HdzKyZ58hRaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Apr 2022 14:56:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/4] mwait-idle: add core C6 optimization for SPR
Message-ID: <Ymk9mvqXfqMDzKVs@Air-de-Roger>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
 <002d7dbc-8290-10d3-6e6e-c5947c1ace82@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <002d7dbc-8290-10d3-6e6e-c5947c1ace82@suse.com>
X-ClientProxiedBy: LO4P265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd008938-733b-4fe4-54ff-08da284d6cde
X-MS-TrafficTypeDiagnostic: BN6PR03MB2642:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB2642DE9105E75811750C261C8FFA9@BN6PR03MB2642.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JlOCze4Rr1+Z8HZHpiEbmVBYz4nqPAfcRqNZWblImgni0tkqbgKC9qPHvRAPwTHYDE66pX8M4MyDC5XZoTTHR8YILjEUdd/KbAoMtRVRbHwld0TLUKVm470CMV1oxL01bQghuOu/tO+Du0iVAgtrvoWipVIwOupCg9IbFxGgzT0Nf+cITbtllkjDseef44mPfa3sSZccDKBINp2VSK/oJNCn7moa4BuRd7WjR7BEdgXxZDB9CuZ6rU21nPJQYT8U1b5MC6f24YIQRCVpliopYPi3ym7ulxtuGZYtca8GMrm1hvjNl0gKQHfJ8r01ZNUvDweBxAjPzoLEJ/nJNCUgKV2ssmjfhN4MXiDQHAojKwAjT5hgJt8gtwszs5jhSpdN4mT/UeXjOPKNFfsZQKAZsc4lhXG4OpixtAPeQH9SBnRbHRAB86qlVkRvN4xlo3j5zUWb71u3TeUUoZ1PSUOmKoeWqGVfkN7iCs85JQR0mzoJh3i+yKiVBPWCKFwNZWMW5Hm39vpadoytDbsxSAPBMmsaNL096t0CltsFSeemV0ji3fTVwWRI7xWD+qCTC3eByJSH9X4yJ4sCFylTWFV3QNCHzkICVz0ycZ2eeJDMFckjVzryHlEnHi5WL1KFZzncR3hEZ5oGpqmP4bNeTZLyiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6512007)(9686003)(66476007)(83380400001)(186003)(26005)(6506007)(38100700002)(82960400001)(6916009)(316002)(4744005)(54906003)(2906002)(8676002)(4326008)(33716001)(5660300002)(8936002)(66946007)(66556008)(508600001)(6666004)(85182001)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHZpRnVNVnhWZDhJUk9xYkppNDlqRDJWZVpjaGI0V0NXZzlnNXh3YVlXWWJP?=
 =?utf-8?B?TTE5S01IQXp6Y2h2T2lxViswZTBENFQzTmxsUzJCUkJuMENUU3hXUlJQNVlU?=
 =?utf-8?B?S1YrTE5DNXNWdXNnYjc3RndZNzBMSkZ6SGNZS1VHMEt0MlNjdFVEb3BRaUxz?=
 =?utf-8?B?WWxFdGVjMS8wWjVNTjFqQTh5NE50c25XaExWWU04K3Jwc2J4cWt5bG94ZE5N?=
 =?utf-8?B?dzJxR3MxTzdPRFJlMkhQWjZzU3MyL2dkRzg0dTZDVVN1a09ZWlpBSFZ6enJa?=
 =?utf-8?B?bEJMeFMwNElkdlZoTDk0bGJPNDJRQi8wV1VTV0xwNVdOWWcrRzcwcmw3clBB?=
 =?utf-8?B?dUNvQWFQWnZtdFIxdDlMR0JhOTJHZUlYeUV1OUczVmpCT0hOVVRmVHFNdS8z?=
 =?utf-8?B?MFRjVHVzWWdtNU5KNnJJQldlWWMvbjNSZnpmd2lxUFhKYWszZ3BqTjNRdkFM?=
 =?utf-8?B?eDU0UkpnYTd5K25NS015SGNrenpXM0F1aHZ4QU8ycFFKSFdHTEx2RWdtUUZ4?=
 =?utf-8?B?a3pMZExnS3phTENFbHEwaXZHNmwvaC9DSkpKaU5ZTElGNUJJUHozNUtialVh?=
 =?utf-8?B?WENUekhFWUZ6UGErS0tVeFVjb2RkaGk0RkxRU2hQQmJQcmpDd2pubkNUWCtv?=
 =?utf-8?B?bkJxRkJOUGR3dldsay8rQTV4ZzdTNVg2Tk9GazExemFaclkrcStubEswRU1K?=
 =?utf-8?B?NSthRHdRSjUvdjdRNmR2YUU0NlE3SnhtZnVMK1VWbUIvb3NlM1hhZStPdjM3?=
 =?utf-8?B?SjFuYWdjVkxqWFBZbE5IaGdzNFhuYjBSNUJDaFhDWjhUMmNscU0zVFliSnZW?=
 =?utf-8?B?c0xZUThsV2dOeUgvQ0VMSDV6RDJOMEFBOUlETk85WDFhQTE0TVFaSXhIWnBJ?=
 =?utf-8?B?eXJQVFZaeEV5WFoyU09ZVHhPakNFUEtlWXdkN0RERGUvQXpSS1dJeWVpdlZs?=
 =?utf-8?B?NmxGamdRalRJbThLNlFpa0toYmt6RW40V2tKdGJzTFF0eGYzaVROQ0FmQ3BW?=
 =?utf-8?B?bGdxeXBjN1pETkhPZVZVc2xNVG91UVdnUlJmQnlpY29UTC84cUpBb21DeE1Y?=
 =?utf-8?B?NHVVVDN0eStpMDhJbXk3MjlqWHJjUWNrSFBKdkJCdkRtVUpwK1VwSE1MVEhQ?=
 =?utf-8?B?MFE5NGZWdUFNdU0rVE1QalNlMjhweDU5aG1GYldvZTFjYnBoVVNPVUdlclEr?=
 =?utf-8?B?RTk2elM5UXI2S2hjdXBNWTdiVkYwRjJWc2NPUlFGaGIyTzc3bThXbXJBRVl5?=
 =?utf-8?B?SmZrWVROZy9PcUdUbElvV0lvdGR4T0R5dURKaTFxb3pnSWxYR1kxakluVUs4?=
 =?utf-8?B?dmREdUNzSWRrN0RKY0R3c0JqVWlWekVzWUxRSjRjSTBoNkFzNUVES0xIQ3V3?=
 =?utf-8?B?UzBYazc2MXNPckUwUk9PclNWMWhwMWc2UW9WaWU0YzJKL2ZJRit0K1RtQnJG?=
 =?utf-8?B?Q25zZ2R3Z2d2S2kwL3dIMTNUeU9GUXJERzRMc0hKdEFJZFY4STcySDUxSXhs?=
 =?utf-8?B?WnFjcy9tbTRKSmNzTnNRTXJNdzhGYXhycVN6WW5JSG1LR3VWd0tGVGJYS3Vq?=
 =?utf-8?B?OVJ1U2h0YXFXSExGWHNzaHNTSjBqRERiaEJqNmVNcDYwRXkzYllRWGxwaG1i?=
 =?utf-8?B?NElNZzdFK1NXZmgzSGZFaE52NVJTTW5BK014UlFoaExNOVZPNmo4cFkrWDN2?=
 =?utf-8?B?VWZZVzBrMy9OR044anFHY3Rsci96cFBkVk1CdEdsWTdibk9Yc00wbjJsR2NI?=
 =?utf-8?B?c0M0RDBKZGNhMUFmYzI3aUhkaXZQMXJmUDFXN2tSRy9ZYkJxMXlWMzhkS24x?=
 =?utf-8?B?OW1hcEs0ZVBKbjhKZEp6SHhmalA0NVN6UEwwbUJHZUsvUmpDN3pROXY5YnJw?=
 =?utf-8?B?UmR1RW1IQWtTSzhGcDFBU3FMZlJIVy9hV2ZkTkVCaTRaRlYrWWhlY0tQajZ5?=
 =?utf-8?B?MnQ1OTFYM0o4Y25yb1ZsTlFIZDQwNndNQTlPMHdVcW03OGl0T2MwdjhDcUNx?=
 =?utf-8?B?YVIxU0pYTk1mNVBqWFlyUkdGOVNKOGlxdDRPS096cFdFUmpXRmlScGczQW1J?=
 =?utf-8?B?Ynk1T0NEUFBYeXJRSS85RkJFVlFreEhXaG5mNWpDMWdzSGpzSDFIOGYvV3F4?=
 =?utf-8?B?a2lkYTI3RkkxbVF1eWsydmNUQkY2U2FYOGc2WmVKRHpYd2FBWitiOW5QUjBZ?=
 =?utf-8?B?S1EvaU5CNEZNK3p4R1kxRTFIVHUrTVFBUFZqZVJmZDFNTzlrODgxK0VsY2ti?=
 =?utf-8?B?V2NpUEE1bE5KVGVPWGN1dURrakdRVWFVMUlDTU12cGtJRzY0SDM1disxZUk5?=
 =?utf-8?B?ekZWcnJqdGJxaFRodDRIKzZiYVNCSTQvakNvb1FXUlhySVl0eDg1ZnViNDVT?=
 =?utf-8?Q?g+UG90P7Tnv2Egzo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd008938-733b-4fe4-54ff-08da284d6cde
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 12:57:03.1699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oh3kMTDmKG2j0KcHZ1iz4kjNU/BX/c71SoGdHYOIDgOARR0lIzsJgN/Rpz65EuGFvvKXwAPYY6tjh8mNhdjwZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2642

On Tue, Apr 26, 2022 at 12:06:14PM +0200, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Add a Sapphire Rapids Xeon C6 optimization, similar to what we have for Sky Lake
> Xeon: if package C6 is disabled, adjust C6 exit latency and target residency to
> match core C6 values, instead of using the default package C6 values.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 3a9cf77b60dc
> 
> Make sure a contradictory "preferred-cstates" wouldn't cause bypassing
> of the added logic.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

