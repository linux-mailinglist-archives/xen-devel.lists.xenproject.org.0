Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4106BE412
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 09:43:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510938.789534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5gZ-0006YT-Ss; Fri, 17 Mar 2023 08:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510938.789534; Fri, 17 Mar 2023 08:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5gZ-0006Wg-Pg; Fri, 17 Mar 2023 08:43:39 +0000
Received: by outflank-mailman (input) for mailman id 510938;
 Fri, 17 Mar 2023 08:43:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=001K=7J=citrix.com=prvs=433d55c46=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pd5gY-0006Wa-7o
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 08:43:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccddda1b-c49f-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 09:43:35 +0100 (CET)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 04:43:31 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5854.namprd03.prod.outlook.com (2603:10b6:a03:2d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 08:43:29 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Fri, 17 Mar 2023
 08:43:29 +0000
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
X-Inumbo-ID: ccddda1b-c49f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679042615;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TNWXN3O3cfy5iZcQDTbCEDMausV/ozWXL5tgCcgqmCQ=;
  b=Tz2LzrxgGFci6HO2Uj3RgvQqOT4/6/2F8mWiLlDYViQY3orHSWFUDXbF
   RyUZxZ02VvqC7sWSJCLBWIde9blyDDEFwDMnGDk2H+D377QcpnH0Wh2pJ
   ttoSX+9/X7YBVMP1iIuqzwf4PX1+BlII1+co9GErGG8ov/Fe73bJkorfg
   Q=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 100039376
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jua6DK+58z20cgjHLzFrDrUDtn+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GIZXWGDOqyKM2TzftwlPN/k9khQv5HQmt4yGgpur388E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklky
 94yBxMMbCqkxNyYnbaqbO02p+MKeZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpiNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXxXugCdlNStVU8NZ13kGIm2UfISYKcmH8+8ep0k7mVehmf
 hl8Fi0G6PJaGFaQZuf6Wxq0sXuVpCk2UtBbE/A5wAyVw6+S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTG4NDURLGQCTTQZVgZD6N7myLzflTrKR9dnVauq1Nv8HGiox
 yjQ9XBmwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:/D4SOK2hgJCs0Ab5n5V43wqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="100039376"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yfq4CXh4HzgEkHz/dNA+4rhmBXBi53w4kpq6YWAM5Vt/Kqq8r0fqQq3UCW+8OEI1zvuS935jRjdswaQ7SpdoyyH/Y6xmNn7OkgXIvZeF1WjS7LoJ7w6FLjaxP2Sghe9vH0exUbkoYK4OSXfkRd0DbkMmEk5lBfEmuRob0IqNnsR1u95dCAJZclx37n9w81DQsX/KMQXv8rQpjeq3/t1oWOaTNa0bwt6tHvBbf/hGs2O6wJR50/iTfsIEfChMl0SzR70OEfhGIenvYw7ZFUbf8+t1Gc/sgVxTzGpBe9CeqgY4ZFE+kERvmt8x8WzursMfbPA6yhztDlXuwKRerFZ32w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TC6gEcbprR+YQ02obtqbKU98TWnGsM6iNBqFbjjtes0=;
 b=eNzdpLOAnHfm02FCk6ESDUNoSrnqbXhpIRGUSu1g0GddS1wS8SVdDisHJFIF9yekuT5mXrXUWUkUDJT0qF8S7gpYkX24lzzdXRNAvCSM9PsPh/9xj6Varu5K03j0eAlyF3bPwKFbFFrIhGvTt+28fkBtHTw55oU9xw+LZvraABSWcp2w5Dc+el7SOmK+QYPHtu0dwI6/mO3RqV5XrNrd/7XdKRX6UC4PVmem9sq0vmWPPKfOb5w+BdBhXmBsk4aA8Z4JEVeqSEVkR2xeF3di2E61F94eo2TcuhNTsXOw5ANQOVbtRnpphNmJGRNd5J60tKMy83Dm/hujIJ3hr8FQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TC6gEcbprR+YQ02obtqbKU98TWnGsM6iNBqFbjjtes0=;
 b=ab2r6BpO+g17Au0c4VAtC5q7T0MymO9hHSralNn3fIugoehpebWwdrqT4n5S2w/lmLYn0ozjoRxVXvz1j3LBob5TsLbSbxPMqft0q45rUd77cKSaEf69RWnUZ3wIKx53D9HOzowyUXk1TeFhwjuzsV7/jLrrchDnLInMvT18/WU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Mar 2023 09:43:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 5/6] vpci: use reference counter to protect vpci state
Message-ID: <ZBQoLFz5T0G7p9Dm@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-6-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230314205612.3703668-6-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::7) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: 50083383-28af-4b03-443d-08db26c3ae38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I3WhePrBEtyC6Xeer4nHEEUPmQ0/D6hqPdA4J+xHC95MDjazk+t+Az4GxmltNDzRZILEanHA+jJNaEDL3AJkyBoyc96vfUY6qa562MjHvwS6yUCjNkmflDZXNy5M8G/dSCKuBZx3OnideUy+5gfLKHsuciRe685g18nw2zlcP9XcBkjkTYWreOmIbbtMT/eUUvqB06lO3fKTU31qrBGnDcfYtmH1xRZ4YqVhOwWDux9txxR00JgHWtp6XSFkednprdQaqxKE1Il+9s0X1yxA6QEgfbrtqP2XaJKfR0x/0rCyo0OPuOGkYmD8ajdPIRPr9tMCbRbJQIUJgXLhdi+fNjshbln1T7IdWhScaz2RDb628USPF0ZJvWP0QOGtmyErETyCnOwOqGwgjygrVjFb/ggy8FGpOjIdiZ9ccIpO5OdG5y1pfYtptnIcUXvyTbU+6hcrHi2G2rO9XfNNZQ0yPKIddBMVlkG5Q4tTcFnhTBNVznq+DLYsSyeE+/5Nl1LWHh+FdxVFCWaWKBHJye662J1tCFEsSTog6ZJN22rLJde3/NeOb+TQumsWVzpzZPt49kqX8NQDUFqznArswLcdQkSyUblYLD1mtKN0LWbO4WY3PVq4tM/j/ltGKQBlaiPUDvTzhHSf5hDSJ7cefGZ2ZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199018)(85182001)(82960400001)(86362001)(38100700002)(2906002)(41300700001)(8936002)(5660300002)(33716001)(4326008)(6506007)(9686003)(6512007)(26005)(186003)(83380400001)(316002)(54906003)(66556008)(66476007)(66946007)(6916009)(8676002)(6666004)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enZRWHk3TkR4T1JaVzBTc1ZJTjRtMEVoLzRHZmdKaXZ6ZFdEYUU2bEl6SVl0?=
 =?utf-8?B?N0hybXVXb3RSZ0JIeEdPV1JBS3ptZ0NQbzRtaEV5Uis4SmtSZXdYWVFoZ0pL?=
 =?utf-8?B?L002c3J2OHdncWdhcW1XWWI5L29lQjU3VzJkMjYvRGpYeG9tNnpmWGFyUVhW?=
 =?utf-8?B?RkFoQkdhSEZybnlxOTdkWFljUDhRbHU4cTJDM3FHY1dPVE05YTMzeGVJS3RF?=
 =?utf-8?B?T1cvaUtJT0xxZ3Uzc0hBckQwdDRsOHpXNmtZRjJMbm5PN0t2Z3IybWZZcVhn?=
 =?utf-8?B?clgrZ1BNdXU0ZHpmQURLNkZHVlFpWEl2c1NtemVBNlRSWWhKdHB6akt1TDRp?=
 =?utf-8?B?VGFmL001UEpYWWxtUnZ2WWtwandOSndjRXhLZncrRThreTI1NEJGVnUwczk0?=
 =?utf-8?B?QnBZZFJ6SDZJRndHQVVEeVBGTEpxRy91UFdtRXJKbXJoK1dzNytQUnczZ291?=
 =?utf-8?B?TzArd0d0L2pocVpKTXorMlVudVJydlZQa3Y3Sm9rLzVPQkJibGo3bW0yWTQ5?=
 =?utf-8?B?ZSs1cnBqV0pBK1NhTXJxdWZ6d3pUT3ZTSWZjWWZSOWg1Z1RFMDM3cXBFTy9R?=
 =?utf-8?B?RHVXM2pCVWxtREljbmV3ZndlQkkwRlZoSkxGdjEvVFZ5WWV0UFRmaW9tYTB0?=
 =?utf-8?B?MEdIYnA3Y3orQktuWXNRbFZzV2gyZXoyNkRyckMxaGpxSlZFc2dwbHF2akJN?=
 =?utf-8?B?bm10Qy9mT3dmR3p1MG1ZRldEMXhwR3FhVkpjVUw3WUl5MDFqNHV5bk5uQkdw?=
 =?utf-8?B?YlZVT3BZb2NpTk5EODdPNWxHSFg1dCtWWXlnVk5NZ3hXbm5TNE0rMDV2Q0xI?=
 =?utf-8?B?R1haM0trcnBBdDF1a1ZiejVpd3BXY3A4MVk4YWRhZUhYQXBDN211WHpSbHRS?=
 =?utf-8?B?UWZmOTIzVjZyc0xXenJLMW5JRzdjOTcyVzhjVnhKZGxqOTJwU2ZUZVRaWVBi?=
 =?utf-8?B?MmZYeUVpMnFMQzR6eWJwdmJrNFVsOGYwL1pjRWhpOVFOc1RwQVF5OHlNUUxD?=
 =?utf-8?B?a0JTUitHYTZPaG9icFpieTF4N3llR01mU1lINXk3dXNPSkltOWM4dUtKT1Vy?=
 =?utf-8?B?bjB0YlNLTnlRT0RGNHBkNjlzQStrQlVNWURueUZXc3BZR1B4UWgxT0oxaVo0?=
 =?utf-8?B?cGt4R1lRNHVJbnZybE9vWGJmMWZxRW50NUxaeUlsY2NBaURrUlI4SGpRYWhT?=
 =?utf-8?B?UzgvQTE0SWk4czBqRHp3VEREbjVxYWpIT24wdlVNeGhHWmkzZklYVVR1L1p4?=
 =?utf-8?B?eU40UTgvSGRwTkVpcFplbkdvZnA1ZEhPNmN1NEc2VzlVRzNsaUtIakNtNDVI?=
 =?utf-8?B?ayt3bXdsUW83dlUrMkFtbWtpc0h1MUJyQWtFL1RnbkpEaGlGVjZpYnozWlgv?=
 =?utf-8?B?L1UwOElJcWlqQnFPSHJaTkFhTEFPZXlYQlEvSHhheEJ0ZG85d1VOUHZ2OThD?=
 =?utf-8?B?Ym1uSEFsYUdmbkxjVXVoYzJTclBOM2grN1o4MXhCbHhyd29aOHBWU3NqMG52?=
 =?utf-8?B?a3Z5U3h1MXFER2RyUWNhWWJaeThZKy83SW83NTFtT3I1QnJuNVBid0VjNGND?=
 =?utf-8?B?RzhzRERmL24xbXdndVVnNHhyQkV6cnNxT2s3SG45RU84U3FQN1E5STc4WG9D?=
 =?utf-8?B?bmJ5QUpSSTRSUGhDUkRyQTRqWVVIaEllWERyL1dRcjlqVHRLUi84OHdpOGJa?=
 =?utf-8?B?L0haWU9rZWx6aVYwSzBIU2JUZFFmVjFQSVlqZWRMQ0R6R054cTAyY0JpbHp4?=
 =?utf-8?B?Z3V1OTBPVWZXcFp1RU9sdk5xTWs0YnQ1QUJCN0RMdUNwejYyZEZ0d1IrTytx?=
 =?utf-8?B?dkpzck5IeVloY3NxRzJ6YWp2V3U1RFVKT0owRnZvazB5VEFmZjg0VnVpc2Zs?=
 =?utf-8?B?NWZvUS8rWXZhdVFNR3pQaE9CY0JIaWRrWVl6dkFzaWxWRWNLWHh1ZVF4MVJ0?=
 =?utf-8?B?cTRrQk5sN3hhMmVKeFAvaTRuNE4rSExiQmhzNkhkYTNNK2N1c09EMlVaRGtB?=
 =?utf-8?B?RzFOcWRGdXFGUWhPRGhGY1Y5YUJFM2tCYkV4N29VMW9xMEZXdmt2bkxYQTRH?=
 =?utf-8?B?VjVNYi9vQTRtMmtZTjdabmN3TmlVQ2dpbkF0Wkt1b0lXY25DWG9BSjB5dmtI?=
 =?utf-8?B?Umd2V0lIUWJPNDVma2JJeERFQUluVkJ1QW1SWWt1d3JSOEdMYitETXNFazRW?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qATH6CcN5GykMQVUV/bGsXWEMD9q1EhyB7aCato6BnzbZ9sjxIOvgdODiphvY9kCKBXf3j6bc/D+7uQjQIybb+H0M2dVQJUPPVyAQ4q4tslUTjQJ1+Y1JxylE5U3J9fxvLDMu+UwMzSQ4m0zGMdf6WvCCHpwduFKvW9TE+WBLZ0zi5abhVR+CnSreFB5Iz+q1f4vXu+8GzMEWBn/6hgVhD7In6S2QX+sDlLXhfOFlb5sD4qcFcAUr/X3+q1rHktWsaMWSXrYmiORCkOmA5LHX6djDTiphtaP4Y9W7zZmldDa3qfreO2ZFGH1hz42Ccen1JvW7Dpk80NnU+9SWBrjLR7cHq2IxLo/c0fngFuHWyHmfFCISih7fTuJ7zLazOAxHdB+lmw6ux7RuEqZGiQ8f9Tqe5MH6FcWkpNepCAth9YmaEYOKq9m2faoYGND6GUoqkzl5GAJGBtGTs8CHLVCLJUB0hErI165JUkUEQrAph/Er1Euc9zuwwQAN0z5uUnrgLbMLhbZZDs4xZf+cxGLSOKArV0R3V8P+utrPOAZhuz3JppVBRv+fdpd8dlWgqtOTHMQgoAI5eAjz6JIl0959Rih6RZFKIDnZBgFtij2FoH1ho/6WHupdYGIGT0O0jshoqR+D8wgaO5OTOsowhfKlspkpeX/u42hlROvHyDJ9gqiHFWlt28qSYmYtMdC5BcPsxbgrEI7EUoCt2ECSOtjD6wTFC8VQ5fZ5ekYP1ZKaRi6YPXF+p72YGmVk1u6IS6ky2ZndSCZkuOH6lcMeq99g6Xlm/Nehmyz+cQL2hO9yS8D4Lj1ljtA8k+z9azT9L8kzIaGyjMDcX2rWOGA/LsEhQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50083383-28af-4b03-443d-08db26c3ae38
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 08:43:28.9270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDI7CWrsHBQkIU8r/mY7GMatHYpJBYMf6xSdwXFeqNmrPHdUwc0d1QKL3/+JLSQZSeJYJ4U5vF4rkLGc6abCsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5854

On Tue, Mar 14, 2023 at 08:56:30PM +0000, Volodymyr Babchuk wrote:
> vPCI MMIO handlers are accessing pdevs without protecting this
> access with pcidevs_{lock|unlock}. This is not a problem as of now
> as these are only used by Dom0. But, towards vPCI is used also for
> guests, we need to properly protect pdev and pdev->vpci from being
> removed while still in use.
> 
> For that use pdev reference counting.

I wonder whether vPCI does need to take another reference to the
device.  This all stems from me not having it fully clear how the
reference counting is supposed to be used for pdevs.

As mentioned in a previous patch, I would expect device assignation to
take a reference, and hence vPCI won't need to take an extra refcount
since vPCI can only be used once the device has been assigned to a
domain, and hence already has at least an extra reference taken from
the fact it's assigned to a domain.

If anything I would add an ASSERT(pdev->refcount > 1) or equivalent.

> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> 
> ---
> 
> v3:
>  - Moved from another patch series
> ---
>  xen/drivers/vpci/vpci.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 199ff55672..005f38dc77 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -62,6 +62,7 @@ void vpci_remove_device(struct pci_dev *pdev)
>      xfree(pdev->vpci->msi);
>      xfree(pdev->vpci);
>      pdev->vpci = NULL;
> +    pcidev_put(pdev);
>  }
>  
>  int vpci_add_handlers(struct pci_dev *pdev)
> @@ -72,6 +73,8 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      if ( !has_vpci(pdev->domain) )
>          return 0;
>  
> +    pcidev_get(pdev);
> +
>      /* We should not get here twice for the same device. */
>      ASSERT(!pdev->vpci);

You are missing a pcidev_put() in case allocation of pdev->vpci fails.

Thanks, Roger.

