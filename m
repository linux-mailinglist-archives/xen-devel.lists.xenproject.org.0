Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F49733364
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 16:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550257.859237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAAIH-0008RX-NR; Fri, 16 Jun 2023 14:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550257.859237; Fri, 16 Jun 2023 14:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAAIH-0008Po-KN; Fri, 16 Jun 2023 14:19:17 +0000
Received: by outflank-mailman (input) for mailman id 550257;
 Fri, 16 Jun 2023 14:19:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qAAIF-0008Pi-KI
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 14:19:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2034d75-0c50-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 16:19:10 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 10:19:01 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ2PR03MB7110.namprd03.prod.outlook.com (2603:10b6:a03:4fd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 14:18:53 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 14:18:56 +0000
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
X-Inumbo-ID: c2034d75-0c50-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686925150;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LoGNBidYuDMD601mu4KlZfZlBuYRVPKeoHr4p2pQcMQ=;
  b=bc3zIY6cw8TCRvbZVVkonPsOv7SljbWXgiLg0bZ3kYRwdTZ5LuHuNErN
   MSfztoUs8mMXIXM0o7yru3JKfXgdATfZLqCZBvWAk9YsHuGyXj3kCGGZ1
   Ozj6E+oVpB0H9FFXkTN1nM4A2/VEeXdKUJQtpNcf1X5/NwrgIg91sRl/T
   8=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 115617747
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dWlR26NXcxTNA+LvrR2DlsFynXyQoLVcMsEvi/4bfWQNrUpz0mNRm
 mAfXTyCM/qDZDTweNwlaYTjp00G7ZfTyYRrTwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sBIXmBQ7
 eIbEioQNTvYoO24zpieS+Y506zPLOGzVG8ekldJ6GiDSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PtxujeIpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyvx2LaQwn+kMG4UPJG69+dVgXu5+nEeKUNJcX+csKmhlHfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaPCEUKSoOYHECRA5cud37+ths1VTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslROOZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:QXxIsatbw9+q6qCiGmxalEVM7skDVNV00zEX/kB9WHVpm62j5q
 WTdZEgv3LJYVkqNE3I9eruBED4ewK6yXcX2/hyAV7BZmnbUQKTRelfBO3ZrQEIcBeOldK1u5
 0AT0FIMqyVMbErt63HCdGDYqwdKQO8gdiVbDrlvhFQpN1RGtpdBtlCe3um+iIffng+OaYE
X-Talos-CUID: 9a23:K1y1+WDLJPMaDDf6Ew9Yq08KAt4mSGfAl1yLBEC2B0xMSbLAHA==
X-Talos-MUID: 9a23:ZXlirQTboZD5elAwRXTAhjB7C8ZOyZizBWFTzrEinNjULTJJbmI=
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="115617747"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbrP6HmwpssHW8K0ghbY64Fz5iVMcN58ugSnGbg0b6cq66WgoW86oZ0SBvCJomgBetjY4/ZfunLkZYUaQEcqWvMkcH56EM3sFZWpHxwTnbCDkqXCzMs0Pl1eY8yvXcvBUhJWPW10XY/2PIaSfNz17aF9V05Zv2vkg6e2MeAKA0FovYZ601LKo/fP+OyL3UEAsxTeMFbO+d9Hrj5yrfGIlyqA4m7lvX9Ja1zr0ksVwyhSE9T1q3FPL0dOTi4XHhjZh/oLcDNGMjIUo1CT4jtZg/Ukg+OTBdGPBvsqcCDJI84CIyRHa86fqjXjTT03HVTh6WPgzlbEvrIRM6PzQeFfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMRs5HB8KDONtHqFdLtM9HLt+kXNH5MONu4AiB7pklo=;
 b=di2pCADf5Y1PCzNv3PHbAXrtDAWIi+8I6Zmcfp/kNIOynJbmH2TBBVNcRN2cUWvwNQSBpOXufz3VVPWRlK0z37hR6P6etMdwEplhesbBwcYKX5ebICssOPsvQ3ZCHj2uUFuPiqdQB8XO/9mWein+tFZx2eQIhUtq1JZxB1/KnKernwy7M0K2kNYiuBKlN4n7QsE24dcgzgx3NHba/99D7Cz9hcPWCa45lI5qEpCxG0ju85BJJxWDbQorfA/eQLDkYt3mjjHOvIaV+iK4c1yEVSiL+/natFsxzPdUIIrsBPadJrj4cCMyMzkiqqefj1xhQne9t3OBfSienX4Na2i0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMRs5HB8KDONtHqFdLtM9HLt+kXNH5MONu4AiB7pklo=;
 b=M1Oq6iAsWE2FxJyMrnmFZQ5mD12kZTLm+/9iTPd7yBeeuz2h/wrdVPw53m5qfg6wEJiz45ke9X1ZWagvCOdFZ2au8jdGnTOxsf4nMQBAWKqHIa8JIjopswIcZizLH/VJR0Fk49TjkFQ5iYQuXcXUmg6iULLGiTrcV7goOe/jbi4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 16 Jun 2023 16:18:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] x86/vPIT: account for "counter stopped" time
Message-ID: <ZIxvSUurSPCHV9+1@MacBook-Air-de-Roger.local>
References: <eaac83a2-8254-76b4-9bab-411e1e323851@suse.com>
 <7b69e322-bc37-a1bd-444d-b2cbe1d76b39@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b69e322-bc37-a1bd-444d-b2cbe1d76b39@suse.com>
X-ClientProxiedBy: LO4P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ2PR03MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6423a0-b16b-46dd-9088-08db6e749e86
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UqwCo+htZ98HnbOyihT7CNF1xvukzDG982INaklMKnu+r3Zh1IBaKqjzQgF1Urg1HR5hZi+7pOy8C2DrtdU4tHW6mUZv8RHgoTljWZhXRat2PIK0/piEtXuwgZtQJs2HQJInK8DzwDGkIDCGYhwjG3Cg2YY21f4CDnfUL54LEcNgEMdFup8OEbVqk7yHwTXQxRgW9xHxjHtE+dgVW9Odr+Td5F5mljnLBCz7d1zduYFztWZ+eEvrSO+uplDMGjUwW+e2YzFktTIRX1r8ljtcd4/e3V5Pm1xCtS4R06cSVpJ/P6VIVUek66kEAH1oNmqS0SuABRHVAaXI6Rxq/n/lFdZ7ui/Tp/VqQS/zJmE1pAnjua1W696MZqRT9f44eE63r2LhDN+dwcm3vn/mq8qtsD5IQN/sViENOSR+uaBmk2XgXqe8xGpCSTNQX7OE01uhRuEVS4LUrd/tawWBOsFBzErMXQLN3CeZAm6cqzkNTPpdi6UcMiYqFsmH+dVIUgODWbZKLh0zfH+ceJDcITpjljtRsW2Yf/DeQIdxMQqkjm+4lUHokaRli/7rK1tBELdcuCTtwurwfJSK7arxbJaF/FO4gogsZ+CeVgHEWlb2Tff2q9oj1BVFHBUOwvoX5tKqQmgIVMc/RBjFEo8Qqse5LA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199021)(54906003)(41300700001)(86362001)(66556008)(66946007)(316002)(6486002)(6916009)(8676002)(8936002)(6666004)(66476007)(4326008)(85182001)(66899021)(508600001)(6512007)(9686003)(5660300002)(966005)(26005)(83380400001)(6506007)(2906002)(15650500001)(186003)(82960400001)(38100700002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEdTSk1kUnZoZlQzUkcvY21HaTRKRlNka0FUMTdJQ2JzR1NOSXRTbThDNDNP?=
 =?utf-8?B?UHJsUDg3d1JpdTd3NS96eWFkMk5mRUl5dFBGaFg3RGZ4VXBVMnZqblZDTHdR?=
 =?utf-8?B?MnVwODZTWmZEaC9MY3poNVhUT29VNTM5MlhYRGl1NlFObVA3Z2MvdHl6ZmZS?=
 =?utf-8?B?d3B3T05BRVhhNDdDUGwvU1VmWkJrUXVzb2Y3bkQ1QTlPTENZVlo0ZE5SSVJ4?=
 =?utf-8?B?UnpvbExhSWZvZGo4Vk5YUXcrdmo1QXd2Rk5jMkJEQmJ2MGhqVk13VEFIeUhy?=
 =?utf-8?B?L2VhLzN2SDZUbVQ2SnJJMVRtSDJxZStaM05VQ3FUb2FGSTVTSjl6U3FmUi9I?=
 =?utf-8?B?aHloR2JUUnd5SC9rY2Q5Vk43QWFZd0ppK3J4V1hDdXM4UVFObTZSYlh4WjdQ?=
 =?utf-8?B?TTEwcC9YazF0aWlvTlZUNWtXcDc2eG9pb05rT0lDM0JpL1hMVlBrQnBFS3Bh?=
 =?utf-8?B?ajFQMzUvZndrYmliWWVnUXVzYnZkamZIWTd0cU1GaTNWempFbnJiRHlqVXpX?=
 =?utf-8?B?WGdiVHRMMHZuaXVOS2V4QTYvK2ZObjU5YjJMZ1FYbVgrQTU3MGRhaXdRNzJ5?=
 =?utf-8?B?RU5HcU1uN0dwZnFOWHJRY2dKbUVRWFpnejQ2N2l4YmNRaldIc0JXODc5UVRP?=
 =?utf-8?B?VW5kVDBpRG9EQjlJZDhtbmYwbUdWUmtEaDNTTGc4SzArYi92NDF2N1hzMW1U?=
 =?utf-8?B?Wm5pMVBhWDdpdVc0bmI5UmJaWjRPNFpTeVdYUmNtSmZzWFhta1dCMit3MnY3?=
 =?utf-8?B?cVEybisvU2lXL2dCb3lsRHhLTmc4a1dXUXF0N25DbHpucE44elJkeUlqYmtk?=
 =?utf-8?B?bjhZdWpDc0I5ZXBrUXdtdHIwYzBRQ3ZpbW5lRGdSWE5SajhoMFM1azJJYkZ3?=
 =?utf-8?B?ODJXVG1kaHJWQUdUb3FmOGpqbW1Gcyt2M09BVkxlNmxjK254N0dCYzJ0VVUx?=
 =?utf-8?B?SzZ6MHBRUlpvMWZYYWtuSjZqdUpKZUxUK21rYmpCME9DWGZ4YWtlWXVIcE5V?=
 =?utf-8?B?aGpVU2Q5TmMyblJvRStRUk9VK2JRankwaVlTSXdmbFgrdFBjUFZoUDIvWFUw?=
 =?utf-8?B?YXQ3aFp1Z2RYS1Y1dS9RUFRac05wakR1SEFTSFU5cHU3WHlOdWJZL1RPVGtp?=
 =?utf-8?B?WXorTXRRZ1J2R2dJZzVwTnhUK0R1ZW5SbGlQeWRiblU4bjZyTTd5bEJvOXpH?=
 =?utf-8?B?ZENscElGM00wYXN4dnFubXJ1blJzRU5Ob1VOVmJTclZMUGpma1BiUUlRSWh6?=
 =?utf-8?B?V0xGclAwaXlMS2VzeWFSUy8wdFBSRUJVeklGRDN3UlNIOTBMdlQyb3RUOFFl?=
 =?utf-8?B?eTdhcCtZNmdCbkd3K2FTeldvUEtiY2UzS0QyNzJQRHBveGIvdzhGSlNVMld1?=
 =?utf-8?B?dUZVTGNnOVhyMTU5YWdEMm13cG1vclJFdkVRL3c5MHZ4Y3hHZlkwbFIxNkMv?=
 =?utf-8?B?aUE1bk5RYXlwR0lRc21iSFEyU09aalVqYmxabkR2Z3hXUmxqQnQzRUtxUXFI?=
 =?utf-8?B?dStlVk4zY1lQQ3Y2TFNKYVdDMDcrSys2QThlTVpENVVNUHJJZHBwNHJsWmxN?=
 =?utf-8?B?cjZnRjFaVVVuZ201N3ZTMjkvNkxwcVJaSnpLRFNMNzk0ZlU5Mld6d2NVUDla?=
 =?utf-8?B?M1JPUjFFZXUxVjExMzc5aU9aRWNUMm5xL0xqV0lET2dMckdMWTNkUkl1bWJn?=
 =?utf-8?B?RE5tR1VNQ2hFK3NvcGVSNkljYW5OU1BzRldHUGlNVGtNN2VCMWZCV3hvLzA0?=
 =?utf-8?B?ejJUTWhrNWkzVHM0MnpHcEVrbCtEdU9HRDAzelJybEhtZHRuRk1rRmdIRUVs?=
 =?utf-8?B?VVpBcVFibzJPV2o3YVNlamMxRUN4MXYveUh6ZGhZUFR6OHZiOGxVSnEyN2Ra?=
 =?utf-8?B?bE5ITmhWdmRIdzRUelRIRER2UHA5NWJFR3BnL05iZUc1NVZLRFJqd2xZQzJu?=
 =?utf-8?B?Q3RtTzFrTHJMSndKWkFVemErRlh4VUZWa3VPR3BzcTdiWlVubllyOGVFbTdF?=
 =?utf-8?B?Yk0yNTVhTitMdHJyV0FxUkJFNnNnbHVmWUtlZVRkbDJNdlVtdC82eDg4VkdD?=
 =?utf-8?B?VnF5N1U0RGxEYUtxQlpTbCtSOWFua3ZWL1luRkZ0azhPZ05JQStja3hjM0Jz?=
 =?utf-8?B?d3R2N3M4UjBCVi9MdGlmeHNXQ1E4OFF4SmdPWmduQkpWVmk4RGJIenVnWSsw?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VrKE2TC+cJQNelUeol3l32auTgoe0q3QIknHkqB5O7GJ5Cs7ccVw5Ohy7QA5PUjZikhvrC0FLDFO3dysYW3iJu9JJ1S6zW+0BnXfRagjr36D2VCDPKTDHhPfABmu0nRSFI5BI2Jiz7Su8b2dqTJBxCQksHdgGwoNzrEiKteTaExjKyCuRHe7B6uu1eHNl8qq2mk3L2BIQ5AXt4KRSmvznfYxvdI58QzsD0NbaTGU/VEPT1r0doE5jvruSiTzMpObcThO75R4M++Yl/bPhIaIAivk6Q7WdG1FCO/vnOW4zbwmfQiCHpKQGEgec/JwvJmgYAl3VGtZFlepsAriCRImEIa4AvA6fST3w8tOsfKrWE9CX38POd9ZnqihbjhC+FX3Uo0FlA+32IMCfwmKUtXh4SfvoMEJCcUTx3qclV7xW7OwV5/BMsXu8IOpEL5Thdd6zP4H95Ng1HwiS7LP7em3YcWZ9+J8L+9MB5P5uKvdmBWmrJ8BiWCwU+9ZchkFmxWB/u3l3AltJlc815BlLGLMceQDDr0Q6xcYwF1jfRGGbo2k9dFUumvHXNy15aOP2fyMowmi10IevL+Mlx5u25qkiEW93aHANeW0AvpY/joW0x7z1BV+kemwdnD3EgDXMOKBqM1apa+V7etaKdUkVItlBVlJ4qOfSHz7IFKVr3Tsdo+cM147HNQZ/Nk15009k8+mEV/lpUaPLE2nklO2cubSuHDuSgelz5cJ1pe4jfstt5RwAJecplLgnksGJkmesdAOUTD9lvmFeb8ee7y0obonAN4HHXoVS8qSh7uq61vHYBiRQ3lfeX86WTbL2bRGmd57
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6423a0-b16b-46dd-9088-08db6e749e86
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 14:18:56.1342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfQgBqrr8nEMzHPGQZtWrAOCQbnKoiu1imCdwke1nDDZgJmdxVkTFylVRvyWyuYAOozkQcvtO6KYxSqKoFNfrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7110

On Thu, Jun 15, 2023 at 04:56:22PM +0200, Jan Beulich wrote:
> For an approach like that used in "x86: detect PIT aliasing on ports
> other than 0x4[0-3]" [1] to work, channel 2 may not (appear to) continue
> counting when "gate" is low. Record the time when "gate" goes low, and
> adjust pit_get_{count,out}() accordingly. Additionally for most of the
> modes a rising edge of "gate" doesn't mean just "resume counting", but
> "initiate counting", i.e. specifically the reloading of the counter with
> its init value.
> 
> No special handling for state save/load: See the comment near the end of
> pit_load().
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2023-05/msg00898.html
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I have one request below I would like you to considerate.

> ---
> TBD: "gate" can only ever be low for chan2 (with "x86/vPIT: check/bound
>      values loaded from state save record" [2] in place), so in
>      principle we could get away without a new pair of arrays, but just
>      two individual fields. At the expense of more special casing in
>      code.

One bit I'm missing is how is the gate for timers 0 and 1 is accessed.
Is such line simply not accessible?

My i8254 spec doesn't mention this, and the (kind of random) copy of
the ICH7 Spec I'm looking at also doesn't mention enable bits for
timers 0 and 1 being available.  I assume those are always enabled?

> 
> TBD: Should we deal with other aspects of "gate low" in pit_get_out()
>      here as well, right away? I was hoping to get away without ...
>      (Note how the two functions also disagree in their placement of the
>      "default" labels, even if that's largely benign when taking into
>      account that modes 6 and 7 are transformed to 2 and 3 respectively
>      by pit_load(). A difference would occur only before the guest first
>      sets the mode, as pit_reset() sets it to 7.)

I wouldn't, but as mentioned before I would also avoid touching the
PIT much unless it's fixing an issue that's reproducible.  I think the
chances of us messing up while modifying the code is high due to the
lack of testing.

> 
> Other observations:
> - Loading of new counts occurs too early in some of the modes (2/3: at
>   end of current sequence or when gate goes high; 1/5: only when gate
>   goes high).
> - BCD counting doesn't appear to be properly supported either (at least
>   that's mentioned in the public header).
> 
> [2] https://lists.xen.org/archives/html/xen-devel/2023-05/msg00887.html
> ---
> v2: In pit_load_count() also set count_stop_time from count_load_time
>     (in case the counter is stopped). Correct spelling in comments.
>     Correct calculations in pit_get_{count,out}().
> 
> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -65,7 +65,10 @@ static int pit_get_count(PITState *pit,
>  
>      ASSERT(spin_is_locked(&pit->lock));
>  
> -    d = muldiv64(get_guest_time(v) - pit->count_load_time[channel],
> +    d = pit->hw.channels[channel].gate || (c->mode & 3) == 1
> +        ? get_guest_time(v)
> +        : pit->count_stop_time[channel];
> +    d = muldiv64(d - pit->count_load_time[channel] - pit->stopped_time[channel],
>                   PIT_FREQ, SYSTEM_TIME_HZ);
>  
>      switch ( c->mode )
> @@ -110,6 +113,10 @@ static void pit_load_count(PITState *pit
>          pit->count_load_time[channel] = 0;
>      else
>          pit->count_load_time[channel] = get_guest_time(v);
> +
> +    pit->count_stop_time[channel] = pit->count_load_time[channel];
> +    pit->stopped_time[channel] = 0;
> +
>      s->count = val;
>      period = DIV_ROUND(val * SYSTEM_TIME_HZ, PIT_FREQ);
>  
> @@ -148,7 +155,10 @@ static int pit_get_out(PITState *pit, in
>  
>      ASSERT(spin_is_locked(&pit->lock));
>  
> -    d = muldiv64(get_guest_time(v) - pit->count_load_time[channel], 
> +    d = pit->hw.channels[channel].gate || (s->mode & 3) == 1
> +        ? get_guest_time(v)
> +        : pit->count_stop_time[channel];
> +    d = muldiv64(d - pit->count_load_time[channel] - pit->stopped_time[channel],
>                   PIT_FREQ, SYSTEM_TIME_HZ);

The above logic is repeated here and in pit_get_count(), maybe could
be abstracted into a common helper to keep both in sync? (get_counter())

Thanks, Roger.

