Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CC87279C5
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 10:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545186.851472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7AmB-0001L6-J0; Thu, 08 Jun 2023 08:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545186.851472; Thu, 08 Jun 2023 08:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7AmB-0001Hx-Eu; Thu, 08 Jun 2023 08:13:47 +0000
Received: by outflank-mailman (input) for mailman id 545186;
 Thu, 08 Jun 2023 08:13:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VlTS=B4=citrix.com=prvs=5169c035c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q7Am9-0001Hc-TP
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 08:13:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 618f63a0-05d4-11ee-8611-37d641c3527e;
 Thu, 08 Jun 2023 10:13:43 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Jun 2023 04:13:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6384.namprd03.prod.outlook.com (2603:10b6:510:aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Thu, 8 Jun
 2023 08:13:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Thu, 8 Jun 2023
 08:13:17 +0000
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
X-Inumbo-ID: 618f63a0-05d4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686212023;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GIsjqDvm1niR+/yE/bliJdfEeSoDQy4pEnm48fyRhIg=;
  b=fh3MovR1txcBVUfnac84fVSVEHAl3oGyFV4TGg2giNS42LDYH/BcAumc
   mCYf6i3tdj4I2/n/s3Z9o70aSA2kDQucDZlCSZNH6qJBeWjDysvpfqnFJ
   rDfy7ZaJNt9CSU6JbXJ7EWM5BzoIoxD+hho7kGZezkqGWNbiN47u198uN
   Q=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 114541990
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6WJG260bvvjeAym5n/bD5eVwkn2cJEfYwER7XKvMYLTBsI5bp2ZVn
 zAdW2jTbKzZa2GnfYojao7k/R4H7ZaAn4RgT1dtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJmNagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfX1pU+
 qAYKmo3dzu9xOCy77ukZ/JCv5F2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFEZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137OSwXqqCdp6+LuQqM9Ann2X3G0qJQQTbEulkMOkgBKQVIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YXec/bedqXW1IzoYKUcLYCNCRgwAi+QPu6k2hxPLC9xlT6i8i4StHSmqm
 mjX6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHc4
 xDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:ETfGiK48NxDFm7qxkQPXwHPXdLJyesId70hD6qm+c31om6uj5q
 aTdZUgpHjJYVMqMk3I9ursBEDtex/hHNtOkOos1VnLZnibhILqFvAe0WPaqweQZBEWj9Qtq5
 uIEZIfNDSANykfsS+g2njALz9I+rDum5xAx92urUuFKzsEV0gK1XYdNu/0KCNLrSB9dOsEPa
 vZyMpbhiaqPU8aZt68ARA+LpL+juyOupL6QAIMQyUq4gmWjT+u9dfBYmOl9yZbfTNT4KsotV
 PImQzh5qmlrrWSxxLG23XIhq4m6OfJ+59sBNGslsNQEDnqhwqyDb4RI4G/gA==
X-Talos-CUID: 9a23:SidiLm0E75av7F7/twmxV7xfRPs/fSHdzi3qOmSGSmRtZ7SKZES+wfYx
X-Talos-MUID: =?us-ascii?q?9a23=3AuLXl3g+GSI4RJNVSagl5NiiQf5lZybqODFoMqLg?=
 =?us-ascii?q?fvvCUKx1KJj3BojviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,226,1681185600"; 
   d="scan'208";a="114541990"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6kZGG4iXSbuZgYwh2wg8SR2n9u55FoP0tP3Bf5hBU0D+1cPUjZ1RweXEpWvoIN21+xMFCtohIJ8/LGLLsGtPyqk85w8HCMtMi+W+B/6L4SRcomM1cIBeNp8oVo/CeJ9SWch/QYAx15/qSgsGb5SVtNyoCtB+mxHUA6EKiHrm7dsyOqdkCuVQkG4yV+Dcez3AwEjz3Gs/R0GaR/En8kxsNhzWc/dZBt97mbn3vaSz/usHS+p1mzjM7iK0DQmkQwZnw9v7+irWHfKwfr2+P5Gs+tKMVlGd06gByRN8ETAjoVyZcToNtr14Co36P0oXM6q9FKAH705g17DZRVSxs6fZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1QjEzIgSPtV4EYswQghhDTDiijxbUwOXLVBrKUhDK0=;
 b=TzW/GQzp9PRVpg5Bmf7TdxYsDkCS5EVxQGO0cSV/UwuRmqMrwkWnkSb4/O2j+kfNh8f7Xn7hTewpvwuvG2KkSlJ4FkwOp75+CwHuMOS+2MMNxY47D3AEcU5eoUDleD4iL4HWyMmdx2UYtH5edY9KM110+IMvn3XmuQMgh2o/Yn6VG4DuaZ1qSFCe8LjuGWPlvbhSZFdlPS0zZAn/g8hd8gENlm4Wzb+12nTdtDOe2+Nob5gN5HfdIuDravsydCJMLwTEyuIZg292CSQ1mUgCVVxFLDrylU1cXnNGw9Q5BryU5I93BFz2U2z9rw0YEOp5qhoqNQXugNNZOFsTOAGVuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1QjEzIgSPtV4EYswQghhDTDiijxbUwOXLVBrKUhDK0=;
 b=gMieyegMXXPFhH9QnFowHNvNT/DHUhkSqg1YCoX3wPQaOfVa/sTt5pQ4qj8FRspfFoSkYCDEYGnDbn9+7e37o48HfMXkN2FOcxFGlKxCqpUGbyFw2BREpFTn40dEnGvUuAxDUlhOtxiixt5AqKmShITGH275BWxy4FR4pnICOfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 8 Jun 2023 10:13:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] CI: Fix the github actions Coverity run
Message-ID: <ZIGNl7oNkcB5ZHzm@Air-de-Roger>
References: <20230607093612.2219286-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230607093612.2219286-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P265CA0138.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 030da7d8-0efb-4b23-390e-08db67f836c5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w3LIxNX8VNpBev3z5LecmtyaLke9p2s88sSjn6G+FXVxRF/cTavnifYcfnWwgc8TCBQ8FacuNgLE1wgJMvgo3uxhv6CMS+DS3N+ylkegErYqe8H+mEQf7jD8kmQcSyM6x5goMOAkSBJ8m8T6FBB07lPNfwixDfbM0PX3w21ocobPcAsgsjS7sdR5+9pG/eJjqqi4rEl7v9DEv291XWDX2NDCyw6WXIqU6HWBcSB5FHLNNavpA57xKT8MyDjbdw40IMzoduU5o1d8ZiSEA/EWX7H80QlasdLe4gA3aydFXG+EDxRNNaA1VwsXCyBHGlOj6xN+NeDX5ALQD57TWv+dyQyALa8J7yaX+Lj/Uj9UGMPTcUEuKZHI5yfR89ELyM9U7A5RWrpF3zw/sL8CEu6basRwlKw3IT+3tHrPtfeB6dc89Jzd4StpkBspCLYu4P+CDdhU5QczhNcDUDgY/5XKySRDwttP47MeuxlE5VPsomynq+JZKQU7HSojb5aVXaszQylmwCLc2fA5vR/igXsBWDThXrfOZitwV4OpjEFmJoEVyV235l18FOFGRWHlrT7r
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199021)(5660300002)(8676002)(6862004)(41300700001)(2906002)(316002)(8936002)(4326008)(4744005)(66476007)(6636002)(66556008)(66946007)(54906003)(6486002)(6506007)(26005)(186003)(9686003)(6512007)(82960400001)(33716001)(478600001)(6666004)(38100700002)(85182001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmUwSXRwNVQ4N3MwYkNyaXczZldtUEIxbHJXek92bllrR0hiR1R5YU5VcDRX?=
 =?utf-8?B?OEJpajIwMmF1b1o1NmVlN2xCelFSYmxmeFBXN2tSWlFUMDZ1QXlFRnkzYURN?=
 =?utf-8?B?dm9qL0toYXhrK1A0MFZtWlNpTVI4N052eUI0QjZRMU53MEs2d3R4THVTdytN?=
 =?utf-8?B?S1l5RGNkVCtOMGxiMGo0MDFaTmt5UHQ0aFRMYkVielVhYUQveG5wWklCbElJ?=
 =?utf-8?B?RWRsZWduTnJUOXk2alNBWUZPQ2QxR2tBL1NKVEl1ZlkzaWo5WlVQT3J6dDFo?=
 =?utf-8?B?NEVKVlUwcENIUEkyRGUvc0V5QzN4aXNVRDZTUDczZ0NsYkgrUmpBOEtaMmNU?=
 =?utf-8?B?VVlRU21nckZaUVd4ODlSTU53ZGg3R1FUSzFZWG4wYytDRHZmY1ZLUDMxOE9y?=
 =?utf-8?B?WWI0aWw3bEQ1YTc2aGpVeFlUL3hhS1JXMlhYb3FoU05SWlU2bnRNMFltR04v?=
 =?utf-8?B?ODdqK3dIRWdpR0lkYi90U1I0RldNSHRRdDRWb1FyUTRuY1BxREpBWDEwd3Ev?=
 =?utf-8?B?TzBMdExiYzFYdkgzY3cvVnRyNmNwa3NwMU5JYm9NZHBxbDljRXMwaUE5RVJi?=
 =?utf-8?B?aVpXQ3h5UnQybUNwSVpnM2Z6YzR0V2pZYTFpb3NueDNEeGM4Q044eGRWNnZk?=
 =?utf-8?B?THQyZUo2VEx6UVIyZzY1cHJNVlNTbW5VVlpCQnpTcEtuUCtjampQb1Urd1ht?=
 =?utf-8?B?d1JIbVNxZHhkdnllV0JRYXJlQkxUNHNKd3NkVitLY1NXTmJhZGcrQjdXZ0p0?=
 =?utf-8?B?Q0xXNTdWZXhvR0RHdkFGekR5UHRtbjZ1SDJWYXczQ09ZVTZkL0NYRjFyNWdj?=
 =?utf-8?B?SVpYbytxOWNzbUFMN3Ywb1AwaVVDdUxkOWlHUDV4NlY5enRhSHI1b2FkckZr?=
 =?utf-8?B?amNkczBYQ2VXdXFBU1ZxWFF2M3NlODRxMVYzYUhHeDRiOHZKemFDSTc1MVBB?=
 =?utf-8?B?WklQY1NHMzRvTHUzZGpCUnN4Zko0S1o1aXo3L3cxa1ZFM0ZxYXRoWmtJN3RC?=
 =?utf-8?B?MlBBZ2ZhWEZGaFM1Wk5iN0hJL3lyM1h3M2owbitXVGNNaC8wYnMrUGM4SVNu?=
 =?utf-8?B?SFNjM1VTMDBuV2F1L3F4Yy9rR1BBb2pSaFFRcldBQ3BCUWJjUTRnSVFpQWlG?=
 =?utf-8?B?RSttR3VtSHRVTWxCT2NvazN4Tk96ZFN3TmdlYUdmUCtZTjZZczdIbGxzcGxN?=
 =?utf-8?B?TzZkMUdGL1FITmNCM05ia1I3NmFXaDJwYWRhazhGRElXekpHb2phcEJkaUFN?=
 =?utf-8?B?aDU0WTVvRGx4Z1Bhc1g5VnFTcjlrRGE0Smt4dVphQ0Exemlrd1lzTU02ZklN?=
 =?utf-8?B?OEdkNHJjWmZuSXJ6ZFZXVDYxRnFqenUvRXkramhIaWw5dTRWbk1oRTdJckVO?=
 =?utf-8?B?QkFhL2VuRUhVRm12dHRsbnBma1E5NjBNV1A1cnI0ZzJoRGx3MVlraDRsOXcy?=
 =?utf-8?B?TklZRWtXL01uRisrYTg3WGFYZkJKN094aHp0RzVRY1dUU253VkxVbDdPYU1m?=
 =?utf-8?B?S2k1bHVFM3lVS0VscXVCS2p2Ykt5LzZZZDllT3hGNm1RSnRsVndhOE5Dd3pH?=
 =?utf-8?B?UkgwckFhUVJvc1ZYV01rb01VS3ltZnpOcWYrQ1BLbFdMdHdWYnFqc3ZxcnZP?=
 =?utf-8?B?UUVjRzQ2TzBVZ3N2UTE2WCtEa1BSNmpYNXJMa2xnUTRmZXhtQTMzaDV0Mmh0?=
 =?utf-8?B?bDNtNkhBT2puSWRibHhJNFduUTVxY0d3bEJzZkhGNGZidjRsbE5NWlhlY0pO?=
 =?utf-8?B?NGw4R2tCWHVvUXVMckFKc2ZMMExCazcyVFpHbklkYjZrNXBLdmxIa3FCcmV0?=
 =?utf-8?B?U1dFTkJMbVVSb1M1YzhPd1BzQXBRZmpJYkFvZUxFZkhPdklOL3oxZmxvcU54?=
 =?utf-8?B?SXhGdjQ3UDcyTVFWaHYzT2p1dHkxNmpRMnhFZ2FYcittOG9QL1dPSmFzV1U1?=
 =?utf-8?B?eVQxbFRxVW1BMDNlRjhLWllhVWlDdkZ1L1VNcDlmT3RwWXZ6ekltVnJWeVlR?=
 =?utf-8?B?TnRRNFZCZURhbTN4Z3ZrSjhkRGszL1M3ZUdMd2xKQUdSQXpVRFhOVHBLdWVE?=
 =?utf-8?B?UkRpMmFXOW5rbm5sQXMwUWpkdXp0dzg2cHRHSjdMa2pDakVvZnFvRWxvREVX?=
 =?utf-8?B?cmh5NjlBUnM5MFZDNkdQSU1nSnVsSzRVa3ZiMnRKbEtFYlVNcjhVRlJ1WDFB?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DVOKkYslhw8dItJ4KQhStjK/iRcDEQQs3aFHNnQCwAl4hroBZmdiPd+oydt4HC3OlseItZKs6v211CSZgEZCKOzZidfiPqeaQ/wKwiWZnavzLwEsA7ayO2hb6xmEaP702p2I9/IAmPOnMJPZtdTdT+cMAxZpxCTfsspZ3a88KtB8djnbwzmma4F1j9d3srbPdeiZWX+hhfuuclTgQBHraReCCRUBmv3ANhxyd5YlkUlSTggnuPpFNY96yyiIhyliEzQ6CSu/qZT39oWwxBKBotxJTtHwudWdcZFMT0xgk8wSgf7eYcwNS3sXnQSli67lsOxWmRXS65Tkk0STYPujVF6uITiImIETTa3luajiY6+P4LYloLjGqWEGLSJaQBCXUX+fCZJYxYODTOW89UO2LhuQnBSMtNAngqRfzaW36H5WeCnVxENaF2xkBWmyqB+HOygWmzy7jXDEzdT0KEFsJfDvix2Cg09mQTWLp8NZ1nWcmNisvVKcqi4qVuAt9+QA/M9lWlPbCAt+wwA+3TvAXLI+M9K5FTRM6rFfGvbm8kNi1Ub3fTxMK1eJYMJbJCGvNF3nH/l7aYthxOPiWmnp9sWnBhmd41mWaRu0TowTEhlUEcVW+OQ2/8feMHaQ/pIteANHq3VOBQIJLA7xxRa1Ta3Ecn5V5zgOp3t1xV42gMPMuyv1Zpu7EI6TQMfaB8fCC2mruqqPldmFMqw7ypSrfh6+0QVz1zpxi4WCQGl3Vj54XbiX7Xjo1YpCVQTXBl1b6BVnkTikaBQQbnLJZRNsimjsLc8/LP/uMQphjEi8ofiOVXioLM9P23puWWzy5PFHj5VVBqzasugmzAmsky/pew==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030da7d8-0efb-4b23-390e-08db67f836c5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 08:13:17.3471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x17joLZmfoAL/ENUmlvwSERra8AiZ/gssvNrJJ1+po6LTIbhEriVEm8HTKd0dPVWqvmqGxS9wVCrQzTDeKwD/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6384

On Wed, Jun 07, 2023 at 10:36:12AM +0100, Andrew Cooper wrote:
> The Install step is failing with:
> 
>   Package python-dev is not available, but is referred to by another package.
>   This may mean that the package is missing, has been obsoleted, or
>   E: Package 'python-dev' has no installation candidate
>   is only available from another source
>   However the following packages replace it:
>     python2-dev python2 python-dev-is-python3
> 
> which is a side effect of ubuntu-latest having changed from 20.04 to 22.04.
> 
> Drop python-dev as python3-dev is already present, and used a fixed runs-on to
> avoid such problems in the future.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

