Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B1C6F411A
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528452.821609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptn7t-00063n-71; Tue, 02 May 2023 10:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528452.821609; Tue, 02 May 2023 10:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptn7t-00060o-3N; Tue, 02 May 2023 10:20:53 +0000
Received: by outflank-mailman (input) for mailman id 528452;
 Tue, 02 May 2023 10:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptn7r-00060g-UY
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:20:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 024749da-e8d3-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 12:20:50 +0200 (CEST)
Received: from mail-dm6nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 06:20:41 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6365.namprd03.prod.outlook.com (2603:10b6:510:b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:20:36 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 10:20:36 +0000
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
X-Inumbo-ID: 024749da-e8d3-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683022850;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QthY+tIi41uwnnmCkFKwhmW5dSImhl3K8J/XmWvKTNU=;
  b=YUFqFKdjI4af/+8jL5JnGwkm4QM7zdTiTE5TTtCKU9qsd0nFJcL1mOUZ
   mSmzc1/Dl/krqj1BQnxqOY+eO2uN52CEgt2xxRDfOB7xdyFxOTcWpjqiX
   sVUXFg+aTU6kXQDgfEVSrUJVsH8wZAKfV1xiqhsQgaEWjRQdoD8tDGp4B
   0=;
X-IronPort-RemoteIP: 104.47.73.44
X-IronPort-MID: 109995977
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Habe7a8MTkRijJFO+LkpDrUDp3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DYcUT3TbvfeazHyc4txb9ixpBlSu8CAztVlGlQ++Co8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKgR5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklVx
 607BG5WVSykuP6o+rODFLVogJsseZyD0IM34hmMzBn/JNN+HdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeIilAtuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eezHKmCd1NfFG+3v10oW2u9mo6MwdMCnSCjeCouE/uVvsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWoISFUD6ty7/IUr1EqTEpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPeRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:SxfA3KOoRp2gzsBcT4T155DYdb4zR+YMi2TDtnoBPCC9F/by+f
 xG88566faKskdsZJhNo7G90cq7MADhHOBOkOss1N6ZNWGNhILCFvAA0WKN+UyEJ8X0ntQtqp
 uJG8JFZOEZZjJB4voTL2ODfuoI8Z2/1OSNuM+b9nFqSGhRGtNdB8USMHfkLqWzLjM2dabQ0f
 Cnl7t6TkGbCBAqR/X+PGABQ+/A4/XTjfvdEGc7Li9i0hCKkTSrrJXnEx2Uty1uLg9n8PMZ6G
 3YlA68wa2mv5iAu3jh/l6W1Y1ShNzijv1cA8CW4/JlTAnEu0KTfYF8XL/HhhAZydvfkGoCoZ
 33uhI9OMY20X/LYW2vhhPo12DboU0Twk6n80acnXzg5fP0Xyg7Dc0pv/MiTifk
X-Talos-CUID: 9a23:D9bsjWOn/4SGYe5DQxs212JKQfsZVULB0k3RGxHkDWA2R+jA
X-Talos-MUID: 9a23:lkR0Kgu0B0F3Xvi7gs2nhy9DBPpY5Y2VEhpSvqwqoti2NHx9EmLI
X-IronPort-AV: E=Sophos;i="5.99,243,1677560400"; 
   d="scan'208";a="109995977"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6/4yz/mBnEpw2zxwgYZIvgNZtvQ2q5nABzETJDF5P8tK/zRNMPprX+G0C3jvFdb/NuybslwByN1Gp3TXRfHkcE6Ej0GglL1+O39zKNFrBM5MEnXqX/mlhHnaEDKSbOLXqk+1oNjwkbNXOo1uBSq+DkOxo8GivxVjo8t614XlD+NgkSB1wtrNAyRD9kSf1Ny2E0lncQlt5aYOP5dsQSzg++00E2Sc6o7FoshTX63bzfrPUS8C5tSQ+wz3VVN0fb+RJKWQG6Eg2mD+/q0ijpb4bYoqsEdcPvEKXQ7DK7pC1FUWbJEAqxdCPKNuNXBZ56RD32tZKBpOR8MEzVTHJAzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pb6iw5cLRiSuesUXK7CeQp6i3v2ou/42Org036m02Yk=;
 b=S8/4/DgxIfVfrL+NibJ1ygKKsLDQqYhXkPYIqyxzIj3coOwiCxii2VYBzt3WfGF1HkiZ/ZOtuPgfIDCBv+qDpbMxisZXrxrNfFLwAnS+3M+SiN1JAgCCmZi4ngtkiwU0AzU1gGyRueJW3giPn+enq98i+/6ZjI0nZg/r9TSAIpq+UeFQ39ZgNeuBCLo5ASuKGu88gdZEL2r5YqBrj1KjbORo5kilfAvEY7idrZwvawUjYYPkr0T32T6KXt62rBXprJWZjoYiiEpULmIu2uB3KLo35kIHjS81sRKpZOrVhuvICYBX4Bfy4zg3fCrk0kHFrj6YsPN3+rKzftwxQGY8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pb6iw5cLRiSuesUXK7CeQp6i3v2ou/42Org036m02Yk=;
 b=iZvJhwSOiAp7jcue6DfVWsg/i3htYt3HgYbyxmrlnIMBbo5fhtC1O9EB9B2uIRMa7JpM39j4+G96vhqkXWOuqaroS1hT1l3i7cKGkr+FQnXpCGkK0DhDoLWB/bTBDRQa1baypxki616bqkf3JkypO2gDBZ+wtZl0KfV5nJhXpA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 May 2023 12:20:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/mm: replace bogus assertion in paging_log_dirty_op()
Message-ID: <ZFDj79NCnfSxnyyN@Air-de-Roger>
References: <104c3456-03bd-37be-627b-45e614a616c1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <104c3456-03bd-37be-627b-45e614a616c1@suse.com>
X-ClientProxiedBy: LO4P123CA0291.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 387bc84d-1553-447c-a90c-08db4af6dec4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Hxk+rzzi6C8vhVIkAoS3Us4QvgmE6AJFqEKyG4AV2qp9kAtncdQ9AAZ1c4j/dFWv9EoPoJXNkKe8ASiTTkZacqpUhL7+Tb/plne8XCBUU+uyMkHv3AbBr9SrT1ay2JQuKCi8TZuU51bgzaH2jYzvVK3/cWFqJdMoTpJxggG7v+AQISi4bGDFyWUxD8Y7OyVoNNYroRzPEt0aNJ20k+He0nntg20/h9Ip8g8cojYZMXaC/TT9UF8NW7dNYLUNRowOloPoKcxNWDMGU/Qhb6KegksukvwPv6L8U3A6MdSD34G8rivkh5tcUWb+SBNfxN4BAjunNCBLCXwiMvJRRM/iNtpC0uifx20klZc+zQb4gST3HHEbnpARhSNtMYhQWJqJMuiEZykiU53XnbuTOeKx9vNdQuX7XYdPwN14vFs2zWnEchuQTe8egzIuCBoy0F5MYKUxDR+WIMEBnho2LX1BGRNsISFeh+QXykQeMJHmq1XE3MY2GYZoIciYH7nLRZ0spLg0XTi8bGUpG2XVjQ7GwPUf6Sm/NNQl0XmBuBymKBkuQOSKB1pqycqR/6GY9Isr9WiE0IBDhzO//tOTYdIAr8CeKFmFqRR4f/UmN3j7ek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(451199021)(2906002)(86362001)(6486002)(4744005)(66946007)(85182001)(6916009)(4326008)(66476007)(66556008)(478600001)(6666004)(54906003)(38100700002)(186003)(5660300002)(83380400001)(33716001)(8936002)(8676002)(6506007)(6512007)(26005)(9686003)(316002)(107886003)(82960400001)(41300700001)(14143004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUdNT1k2NEx4b091cTdWdVlyd3dLR0NCS3FVbmxmdjQ3RFpvVHQySHdacUc5?=
 =?utf-8?B?UURybk04ak50VTRlMnhXUzBwTm95KzdoSndZbzU0NnowdzJhQzNVM21MK2gr?=
 =?utf-8?B?c3VTVVpQeXFiT0RmalhqakNOZTNpYjN3aFcrT2d5ZnRGN21qQk4zT3dJUGxP?=
 =?utf-8?B?bllUSTJBSTFJcXBwOERTZjZzUVZqdStKWmlhend1aXJ3eE5jamMzNUZ4eWtB?=
 =?utf-8?B?Q3lTcWVmUmRNZkMyd2RGQWR0R204SGFsZ2hiNkdHUDFlZUNVVUZRNzNLdEQw?=
 =?utf-8?B?OG10ZVI3aWo2TW9obndWK3JkUWszb1VwQXB1NnQrUlZEMStuWEVraVYxWnN5?=
 =?utf-8?B?WjRTdzhIODl1RlNKb1JYVHMrSXQ2b3hVNm5BbmRnaDRBdnJsQitjZTZPZ0I2?=
 =?utf-8?B?UFVmbjdLZWFma0pCU3FzQXZtRFEzaXV4OTd6ZGtyMks3ZE5ianMzSXVvRHNt?=
 =?utf-8?B?Lzl5Z1d1QzNkWWlpM3UyU2VUc0Y3b0toZ2h5cFIxU0hGYTU5aGN0aXpNY05a?=
 =?utf-8?B?WmU4SVVacWdsM0h3N3g5ZlpwUUc2Vmd6Mkc1REsvTk9VR0h1RG15QitDRFlz?=
 =?utf-8?B?Q1NSUm0xOHkzQk5lV3JIeXFIYWtXOUlGY05SekdHTUs1dG96R2VuaEVHREts?=
 =?utf-8?B?SE10cE01M0laTnFtYTVsSy80dlo1dm56Qm5QWmhTUndiamxEblFmMjF0aU5r?=
 =?utf-8?B?YmZGOVFQM1I3b2xydnFlbFRHTkp3UkhoYkpodmk3cU9nZXFDUytIbmR3VEVp?=
 =?utf-8?B?Q3NkMEtaMmlpZm9FeTh1YWVuTVVIY1d6VThyL3crMHRFVlN1SVF2cGYvWmFo?=
 =?utf-8?B?RUVwQnp5MEYwLzc2MEdqKzNNYllnM0N6UnpodnJyaHdjUFhKbkZ0bDcyaVdG?=
 =?utf-8?B?ZGhNRXdkWU9melpUTUQxVGVPZVZnVXlNZFlkS2NNdXcyYzZ1eWEyaXMwQVFP?=
 =?utf-8?B?TVFCeWQzejh3ZTdXeXQ5dndJMGZ3ZkN6MmlCWHlJd0FiYkEvZFg5ZTYrc2FK?=
 =?utf-8?B?MEduZldYOU9XU0FLMWpTTWNjcTN3TmtzUm5CT3ZOdm41N3ZycG9lSVNMczND?=
 =?utf-8?B?a1NuU3FqbDZQZFU0TTlBMVEvZWRsZzdvR1E5cmpuWXJuajFnMzFKY1cyNHlY?=
 =?utf-8?B?aHBrMGE0TWJYenBEdzJEZUsyTHU4SjlEZUhQMjFZb2F2Nk9SYzVpTGhzWnRU?=
 =?utf-8?B?Q1JqTkgzWTRvV1piZDBwVElvdFdVeC9jNitNQlpTeWNLNURnQkJ6eEFUWDJx?=
 =?utf-8?B?V0ZtR0dKY0k2UzNTSnBHWk1HZDdVaGJqNC9WZlhqRXFKRTZ6YmcveEtweWlH?=
 =?utf-8?B?YWRLYnRwZXhMRTB6ZW5vR3VhQ0pFem5pcSsyNUw3UDdFU1lPM2NUeE04MVQ5?=
 =?utf-8?B?WTRTTTJQOE5yeTl0c1ZtQlY4ZmtDbG8vcUtITThMLzVxR0NNWlBTYS9Fd0o4?=
 =?utf-8?B?RW1NUW9IaFp4WkVQRWljU0VzN3hINWpPdVhjaTVHUUpTQ1NDbmI2SkxDMGR3?=
 =?utf-8?B?TWI4RW5ENEhJalFxUzlXR2Y2VFgxM0FhTTh6T3RCa2NYV1FTMGYxbnJQcU5K?=
 =?utf-8?B?dTFacWhKMGhYYkl0QlFuQlR6ZzUvN0VvVDNkcmcrQTIySWI3eTZDV3cvOTNV?=
 =?utf-8?B?L2VCNkxsTnJpd014ZUlPVDZ4eGNPa2RXZHEvdHYwL0dtS1kvUWJLSExGL0tV?=
 =?utf-8?B?emVpOGxPOVRxQW9rZjMwdVJHUzNOZjc3RnJrNm5hUmxHK0hBaHJsdDFjTENX?=
 =?utf-8?B?NmhxTFd0Vy9LR1N0cXpGMDFhd3BQSkJONHpZdHg5V3RyVHB1STlZM1RYM1Av?=
 =?utf-8?B?Z1czaTVDdy9IYjBZc054a052RThSTlN4S3dMY0VpTWxteXVFMTRGYkNlU0ZF?=
 =?utf-8?B?OFk1cDJOTXlFZTl0SVEya1hCeVc0YWVkTVF1OHF4YmN1MFpYTStaL3dKNm9j?=
 =?utf-8?B?dTREeWd4SWozMnVNVWRMa0FwV1V4SDBKWVZEQXV5QVdYcndZMVNHYkorMktv?=
 =?utf-8?B?a2kraDcvQXRoZWNWY3c4bmJjRFE3Mmx5b1duNXFDM0dnYzNUSlZ3YUlZa0FL?=
 =?utf-8?B?aFdXM01vOG9tK1J6VEtWYi85enM0Z2JDeXFaQTRvNDRpSzdPaGVLMHdOUTBU?=
 =?utf-8?B?eEdDV1BxblRydjlHNnh2Snc3NzlPdDArQm4yNEpVeGd0dkFiYk0rcTNIQWZu?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xX1/mzD8NEsmBdiCe9WOULWX6EQxYc0o1MhdQRESFIpvoIJwdUa4O8sbt5GAJIfQaj6zAmDJqhOsg9SRrVNp9v3Hq8s9BMK6vGk7nTIshd1TCxK5JKD0z1u6TMTT9/ghxTWyXvuHlMabn5FrmLqLY49sYQzGrdDfWXwIt9SknPGPkpx11LtOyRFTHw6CvsKqvjwjCU9WI3z5RU0YbwbfIB0bEbIKvOMQwUUcJ7/01EEM4P/jv4KSUvepFJfzwefPDWfeLmM8CpKEoqEqCM5ALwQ1uxxsjK2e50cxgGBBOucWmucVl9m0rnKXK1mBgsrNq3lUXDDisrKOjkzzxQEik6xzs/7wrldviuxMjuqUbtLvjw3oEP9aWjB/8WcktAjI9cZkwYPAiBRP3utgOleVj3t16S3mI/ZB98LFoZQ9aMdJsvRB1pwat0SnsE1URdFb0Y+n38BHwGOREbVxTHqPS9iYcSJGs8OrMNsGgwKzEgDSAlYDLMzrF7MiR86y8WJ0qti8KSV8+vBCUQ6khcFibhSMXpZU/lInqKWlf2yLgql9Y9abu0X1EgABW0wGgKyn8C+kPMSNuU9MI5SKejT2A9YtfgpGtrObfqmVfHJR3eQEvtvZyaZOP2JhLHZDBVujKv8A6pdgNym1efFxrxoWm5cZD4zFdTWXE/v6V1GRADGSBa5j4OO/m5d3rguUPnvSU1SW7NNzyMaiSQza7MU0cq88r4fDY/QOllxz8T6Lp95g8JaqxS0WelixmcuyrQIxfvnUQXAq4iw0PMudUJYbIecr+uZJWEQdwMCNamPJ0p+04Be23+OL6szVZj6Nvabs
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387bc84d-1553-447c-a90c-08db4af6dec4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:20:36.4575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3BE+uF+eLJjkh5VZPQ1G53u2SryNFd90jhiW9qTPqISdM1ksUWhwc+7/IMvW1Cxsm6uA8K4ROrtOyBsHrXP4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6365

On Thu, Apr 27, 2023 at 02:29:06PM +0200, Jan Beulich wrote:
> While I was the one to introduce it, I don't think it is correct: A
> bogus continuation call issued by a tool stack domain may find another
> continuation in progress. IOW we've been asserting caller controlled
> state (which is reachable only via a domctl), and the early (lock-less)
> check in paging_domctl() helps in a limited way only.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

