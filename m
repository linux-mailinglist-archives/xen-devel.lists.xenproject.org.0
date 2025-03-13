Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B252FA5EF8D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911679.1318081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tserP-00075F-Kv; Thu, 13 Mar 2025 09:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911679.1318081; Thu, 13 Mar 2025 09:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tserP-00073n-I2; Thu, 13 Mar 2025 09:28:15 +0000
Received: by outflank-mailman (input) for mailman id 911679;
 Thu, 13 Mar 2025 09:28:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UDpV=WA=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1tserO-00073f-QQ
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:28:15 +0000
Received: from clt-mbsout-01.mbs.boeing.net (clt-mbsout-01.mbs.boeing.net
 [130.76.144.162]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a752b4d-ffed-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:28:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 52D9S7P9003066; Thu, 13 Mar 2025 05:28:08 -0400
Received: from XCH16-07-11.nos.boeing.com (xch16-07-11.nos.boeing.com
 [144.115.66.113])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 52D9RvKB002965
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 13 Mar 2025 05:27:57 -0400
Received: from XCH16-05-08.nos.boeing.com (144.115.66.92) by
 XCH16-07-11.nos.boeing.com (144.115.66.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 02:27:56 -0700
Received: from XCH19-EDGE-C02.nos.boeing.com (130.76.144.198) by
 XCH16-05-08.nos.boeing.com (144.115.66.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Mar 2025 02:27:56 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.175)
 by boeing.com (130.76.144.198) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 13 Mar
 2025 02:27:55 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by PH3P110MB2023.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.36; Thu, 13 Mar
 2025 09:27:55 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%6]) with mapi id 15.20.8489.033; Thu, 13 Mar 2025
 09:27:54 +0000
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
X-Inumbo-ID: 7a752b4d-ffed-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1741858088;
	bh=1Zra/gtpCyFy2nbulS28Cl1sl68BEoSNougHHCrp1DY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=L/vMw+F1Nw7BbH0xMKcUqhHOObUjrAEBE4gLu5Uc73lgVxAIkXNthbGca4acm9cfY
	 agy0ApB9olnHqZeZFPFXyB/nPKyLcHmlQGWqB1VroUkLxBHXc/bL5EqXFqYuTBlMKE
	 YBG8KY3ZagY2l0JvGXIsQlNKQSUBu5eaxN3hrg3NrDz2cBZd1Hz2gQaJsSF8tlv4z1
	 1EyO+9zc4NRQBx+aCmHwsl2fmwsG/iOe2JAjWMLfaG+xDGFcwIpJs8UzB6MZ+iSZEH
	 B/a+IY4dhzP/56es/5ZcUpGYfcODsSwVdF2uUxqlnk58nfIe4ogXW2M4HHv/FJzgtj
	 Juu0SkZ0khwmA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ImFHzwZFBb688j+beXu9WQQ1j9bow0zQaTBrJ/1xo5Qw2t4ys/sEMA6ser5WNqZusTHL/XST8q/H2sr1e0YIdO14CWfWI8hpBU/X34S3VcP+Et6Q6E8ycaCENao69xFW4yL5Pp8Ps/0T3S43uza+VxvYvKcujib9/9dQPGtcqoUVREJRAwP24nzU12Q9R+YF5nsWkEb/rjY+yt5sS/12+cPt/UO/4pYCOzw70Ft5gemn3ijxSPav2UBtNhY+gDz+8zk8Yao0GUoaaug2/AVYxpt2/t39aJuHATdu7srQuTeKT9pEkjqsCie3WsO5b8lcTXpjSY6IlWRn5X+C8fgN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Zra/gtpCyFy2nbulS28Cl1sl68BEoSNougHHCrp1DY=;
 b=mv29O+25hM0aJOze91cJ4rQuw+7w5vy/TLnJjNW7N2OAJ4re1nRU5QuxKJbJD2WWWrcIcbQNWfOpPdrGtUkbEMqgQY1VEQnbcOrb5dh5R8Q5iS5DqzXtfZUc7iWz7kqnEvPqwSOH+i80GoMHYN4JzqNKR2mUAsjWIDdXCBUvjjgpmMawBzgfkSPfnLIGvvOFeGe2ixasotdAmc9SA82XN0poB4Ccxc55fk5gDRAAJptMFnsB1lY9gqMO0P7gw2UzmDDrBWqXRDVcqstT+vLcfK6NFRk6C0hdIi48bb5hbTF1EqadIZGSzE+kk7CqNTNBUk+HWHnNtduHPuCT+aRPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Zra/gtpCyFy2nbulS28Cl1sl68BEoSNougHHCrp1DY=;
 b=KK0IjphUwcsVDPMYjpELBAneB1EBUnCbe2Hg28qgGGasUGfKfI1dGxxg0GsaTnzD7xOEemI0YaeiETI3+Hb1arZ2rGeu6SdodkgQvJdkFCah75In/XBHVV6mM6DpBDkiEAoa8EXsEj5cK/ExGJpoHOc+0I3Vl1gxOlJ5xbjU3BY=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: Juergen Gross <jgross@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
        "stewart@stew.dk" <stewart@stew.dk>,
        "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>,
        "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>
Subject: RE: Discussion on unexpected behavior of ARINC653 scheduler
Thread-Topic: Discussion on unexpected behavior of ARINC653 scheduler
Thread-Index: AduT5GPU8k+LryI1RQGgVtY2Yt6hPwAA8CSAAAP0WWA=
Date: Thu, 13 Mar 2025 09:27:54 +0000
Message-ID: <BN0P110MB214848C4FE9474A6C050A7C090D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
References: <BN0P110MB214836659525A1FEB86C407C90D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <714d1f40-d627-4d70-b8a6-5e9a13025c32@suse.com>
In-Reply-To: <714d1f40-d627-4d70-b8a6-5e9a13025c32@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|PH3P110MB2023:EE_
x-ms-office365-filtering-correlation-id: 507ad459-a594-448b-1912-08dd621155c0
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bXA0RG1lMFNib2hQZDVzcDJidC95TFRXdXdPMWZ5K2E4Rm55anRYYjFNb0hM?=
 =?utf-8?B?NDJkMTYvOEIwMnRPZi9KWTJwdy9ZSklGN082akdSSjRBa2Vub0MrWUtoR2Yr?=
 =?utf-8?B?WkNGYXpZdUNDc1dRQTRtTVBIRFk4TGRVTmZ1NnBMdXU0ck1ZT09MQkpyUlJV?=
 =?utf-8?B?NDE5ditWRGszdE5xUTVUS2FaRlFsamIxNFBzdHg1VC94eVlOcnNiMU83RkpW?=
 =?utf-8?B?RTBRSG5iM2N4NTJ3Vmd2bnVncHJGWURzU1BFMThXQW5GOEJHZWMvYnFTWDAr?=
 =?utf-8?B?cTNTcW9UUW1JcnVHdG5jYWlUT3pkQmZ6emZuVExzU2dqaVc0T0xBYzNZL2hW?=
 =?utf-8?B?MXFCU2RJbVFvK21rN1orWWxOYnp6N3pXUXc3OHpodlZCcC80MmoveEt4Y3lJ?=
 =?utf-8?B?NmFzdzVDdkdpRlN2U0N4TzQ4bVlFdmF2OStDVmlrbmFsWC9aZzYwUDBaVmgv?=
 =?utf-8?B?RHpwOUx1eDdUMEtQeHhQSlcrRlZQN2p4djB0MGtsVzByVTJFYkZUSGg0MWg1?=
 =?utf-8?B?TDJZVGZOU1VyWjNLVDRxK09ra3FlWEV0TlZpa09BcWJNWkVxelNsNGVwSnhp?=
 =?utf-8?B?NVF4Q29NYWNjZEkrNGdROE1NeXpIeVJXRGo4YTdPMW4vTnhTcm00ZE1IdTJR?=
 =?utf-8?B?S3d1N3hCVW13dnNqVTlSdjBTNTg3Uzh3L0RqVG1kdDNmWHdpVVcyUDJXcGcy?=
 =?utf-8?B?dE4xQ2NBa2lYTGhlVGhFOVhrYS84VEpQUi9POGVqZEtHZFZPMnJ3T0NZa1hR?=
 =?utf-8?B?SkFvSEFrUmZIVldiZ20vampWRFpNMEJoejhjN0ZQOGs4RmFRSHF6MnA0UVVL?=
 =?utf-8?B?c3NxdnJYVEVJUDMwMjdjUUhIbS9rc3VFd3BoVDVzdS9lS2RadDlwaTNaVXRY?=
 =?utf-8?B?eFpxQ3NqOUhZOXlRMERIYWpQNTRxa00vdVd6RTZsU0RjWW1taUttMEt6YjdI?=
 =?utf-8?B?ZkVzVGRvMFlZU3pVQ1RkbXFseEJDZHlYNVZHc1pWbXZjUGU5VDVBTkxKYy9l?=
 =?utf-8?B?aHJoaHpnTzVvWUJjaXpyRGZ3TmJYbXNtVEtwdlhCNGR1U2JKenEzbkZYeXcw?=
 =?utf-8?B?OFhkNTRCSjc4ZW1TQkM2am5nZVZ4cW81eVVlbUgyYmpoenZRTE4xK2RkdFB0?=
 =?utf-8?B?dFBlRC9GQnMvVUVyajcvR0tXazloU3hVc2t4Y1IxRVBKcUx5MGRsNXZ5SnF5?=
 =?utf-8?B?QkNLQ3lQUklkVjJENExRcGhaY3Q5ZGhZVVArR3YxYWRKYXVweitXcGVwd3VY?=
 =?utf-8?B?bElPbXVReGFRYmEwODY2RFpodEZGVGFFcmF0VjJQb3FuK0FZaU5qeCtLOVZs?=
 =?utf-8?B?RWc3WnlxMURIa0pvc0l5YmdybktuSG1mOXU2MXpmQ3VZVW1ZSEpJZWNBQndw?=
 =?utf-8?B?cHJvOEtWSEY4NFhCYjJoRHpLU0lwQjBIWVcySjJ0YjdrYzVnYjFkTXdlTEsy?=
 =?utf-8?B?WVBqUW5nRjZFeEE0d3ZLcjhXZ2Z5bURaMW9RNW5zSTF3c0p5dmhOWFhJSUFh?=
 =?utf-8?B?VjgxY0xMc3VtSEZWUzJmc0hyemFRNi80eitLK2wrZnkrekhrS0EyVUQ3dGJk?=
 =?utf-8?B?NWNhQWtNY2NlRzg0UGdDRERaQ3FRRjBQV1JBcGVlbmhhYVBxOVJJU0xNdE41?=
 =?utf-8?B?enBnTE9wd1J5SEU5MkdwS3Z4WDJyUGJ2SUJDVGpFRmR6b2xvUUhQdWVyUWFj?=
 =?utf-8?B?UjMreGllVWJCN2ZPVHREcERhN3lDeDhjTVAyeUJYV2ZuRWY4K0Z3eVk0bmtL?=
 =?utf-8?B?MHZXeVo3VHF4aC9xVkphckdvL0lzNHJKZ0FmVTVSQlN5clR5K0V6Q1hnNWls?=
 =?utf-8?B?QmFVQUUxQUo4d2doVm5tVUNPMEt5OWduRUJvS1ZBanZCWUU1QzVFbDRwa1Y1?=
 =?utf-8?B?T1hLZXdDandGQ1NQY09KRWEzSzRoSjZQM1NlU1VFYnBQSmYzRnhPaHk0aFBN?=
 =?utf-8?Q?iUZWTOP3WylS643wbfOSTavXE6cPrFSd?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1NBLzM2NjJxUDNlNVZVTkJvS2RmS1c2RTd1bXdrZSt3ZzNrTlM4SGY3Slhx?=
 =?utf-8?B?ZGVrdnM5SUllWm1RaFZrMERtTzBoOXhwSWJacy93OUxHc3VqWEZsYlVmbllC?=
 =?utf-8?B?b2dMNFY4Z3dFcUhRazdSSk5Wd244NFFxdnYzRjAwODdwbGw5UFp0ZGw0eXFU?=
 =?utf-8?B?YWNnOVd6azNXS3hETmhjcDJDSklYdTM1UXF3VUdCcE9LeG5sYkMwYjlQd3Bu?=
 =?utf-8?B?N2k1K2oyenUyOWtnRjZaWE9Kelc0RTBqWjBNTDJieFc0ek1hWS9FTmVkZDFL?=
 =?utf-8?B?eHFCVjlIcmk2TE1SQzhSeWtXeDdoMWFOZmJsWmVCS1pMdUZrbkZGVHBkTjV6?=
 =?utf-8?B?QVZ4L3R0eE8rZzZmSGNURkNQTDlvd1pNOVQ1MVNkcDhhMGE1ajYvWXNDTTFy?=
 =?utf-8?B?Y2JvZjdIRlRZNXZlM0dMMk9SYlhFWCtWbEdhWWRwWmU0c0lURjEwc2tKRE9v?=
 =?utf-8?B?a2k0ZG5CUWJKb2YzR2tYUkEzZzBwRTdtektXdkxWT016TXNMUGJ4T2cvVy9w?=
 =?utf-8?B?VmE3UzFwdzNZTWkxV04vV0Rzam1Kb0ozaTZiTVBHWDBLNlRJRXgrZ3V5RERP?=
 =?utf-8?B?QWpKamxWL0RUNzhvTEMrSEZlYlY2NlgrVUlncDZqSS9naU1sYk0raHU2T3pw?=
 =?utf-8?B?OUgxUHB6cVNFOEtGMmZ3eFljc3lvR0p3QUw5N2lHb01MQ2Y1Nno2Y21CWnho?=
 =?utf-8?B?dVpNNnIvZmtuUyttU3RDdDg3M2M5VENHOGpWRG1BeUt3TFRIQmtJTTFvUVdw?=
 =?utf-8?B?b2gzL0RaVlVGcWoyZ21HRUhpelJqWnB0Y2VMdzM5ck5RQm9nTkp2MWQ5WFFt?=
 =?utf-8?B?MXNST0VZU2V4WEJaOVB0WXY4ZVg1YWtKZ2hmVU5QOFRjcEFhS2FRSFI2SnlG?=
 =?utf-8?B?MnR3NWxNTnZsWXU0dnVlclJqb29ZMDdNa1MrYWNNOFpjdXFoSkxJY0hyRUpC?=
 =?utf-8?B?R0xCN2tCa0pHOFpqYm1nc1B6RVZiNHFBakpMS1J4aW9yczBqSkhHOG95SHM1?=
 =?utf-8?B?T1Rib3p3cnEySDZhUWlSTTVSOEhOOWxGYmdnVFVxWnM3dkRaMCtaaUEwMGd5?=
 =?utf-8?B?dE9FZFdhaldNaG5va21WZnY5ZUUweDZMdFBtMVJESGQ5NEE0SDhDdTY0aEtk?=
 =?utf-8?B?VjFOby9UZGxYR2YxZFJpM0FMWk52SU5yM3I3MEhtZHprOVBpdXFqY1VRZlZq?=
 =?utf-8?B?YUtrYk1qaks5U0tLUmJ1ZG9QTnJrMzd0THRJQ3kvb2pQWGxOdE9STjBhZUdy?=
 =?utf-8?B?Zi8rdFdzQ2J1eC8yaWFjOE9XeHJmZWQ2elpwa2lMODZ6SnNLU2ZYbnErOGM4?=
 =?utf-8?B?Z2UzeFZvRllLZTVHbEYycVdsUy8va1BnblFBNDZ2UUkxZmJQdUZhYXdjVTRZ?=
 =?utf-8?B?TnhSUlBpNTJhUFRBM1Y1ZkNTSFhleWpPbkRrR21OVTRvRUlXM1VDYVNkZ0lw?=
 =?utf-8?B?cTkyOGszTHFMb3dLNzNodExEQUxvbWZCUnNuQUVHV2tNQUx1cVlUbzgyMWVS?=
 =?utf-8?B?NWhHelNXbkdYeFoyWkhCN2RvTDlNM3VaeVozOHpneDFOdEFRQ0h1TmIxcVlH?=
 =?utf-8?B?V2UzUEUzSkR2eWE3Q2VBTHR6NTZENWdZcTkya2RoYmpqUDJUOEtzbkZlRkdu?=
 =?utf-8?B?TW1XODFSSnB5TktzeGlNdjYyNWlzWTBWSklESHhDMGgreG5UaEZCbHpiMEhQ?=
 =?utf-8?B?bXFjSmFtaXN2RVRWYytXaFRuQUZscTduSFVlUlk2bUhuM3M1WmJpSDhMczNE?=
 =?utf-8?B?dUVXV3JYdFhOaVhjTzI0TDNLZllOZnBaRmxqbElYOWVMVGZkaUxkeEk1TGI4?=
 =?utf-8?B?dGRML0hPdzBwaGZtNU14SFdncGt0aVN2ZWIyZ1BXa2VvcDgwTVZ3eGlTSW43?=
 =?utf-8?B?NlVqQmNHRGFKcU4vcmxYb1o2d3h3a0JnbVQ5SWVaWTJVUHlZV3pPY0x1U2kr?=
 =?utf-8?B?aVNKSDVkMDg2TE9kdU1zVm5Ebmt6WmsraUxldTJVZlFmajdDVVpGOStZcStX?=
 =?utf-8?B?NnZidjdjclJMcHZyZElHTGc5eFNrUEMrSUttZmwxWHdRcFkveTFRZm9vQXkw?=
 =?utf-8?Q?Xb40J8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 507ad459-a594-448b-1912-08dd621155c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 09:27:54.8677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3P110MB2023
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

SnVlcmdlbiwNCg0KPiBPbiAxMy4wMy4yNSAwNzo1MSwgQ2hvaSwgQW5kZXJzb24gd3JvdGU6DQo+
PiBXZSBhcmUgb2JzZXJ2aW5nIGFuIGluY29ycmVjdCBvciB1bmV4cGVjdGVkIGJlaGF2aW9yIHdp
dGggQVJJTkM2NTMNCj4gc2NoZWR1bGVyIHdoZW4gd2Ugc2V0IHVwIG11bHRpcGxlIEFSSU5DNjUz
IENQVSBwb29scyBhbmQgYXNzaWduIGEgDQo+IGRpZmZlcmVudCBudW1iZXIgb2YgZG9tYWlucyB0
byBlYWNoIENQVSBwb29sLg0KPiANCj4gLi4uDQo+IA0KPj4gSXQgc2VlbXMgdGhlcmUncyBhIGNv
cm5lciBjb25kaXRpb24gaW4gdXNpbmcgdGhlIGdsb2JhbCB2YXJpYWJsZXMgInNjaGVkX2luZGV4
Ig0KPiBhbmQgIm5leHRfc3dpdGNoX3RpbWUiIHdoZW4gbXVsdGlwbGUgQVJJTkM2NTMgY3B1cG9v
bHMgYXJlIHJ1bm5pbmcgb24gDQo+IGRpZmZlcmVudCBwaHlzaWNhbCBDUFVzDQo+PiANCj4+IFRo
ZSB2YXJpYWJsZXMgc2NoZWRfaW5kZXggYW5kIG5leHRfc3dpdGNoX3RpbWUgYXJlIGRlZmluZWQg
YXMgc3RhdGljIA0KPj4gYXQgeGVuL2NvbW1vbi9zY2hlZC9hcmluYzY1My5jIGFzIHNob3duIGJl
bG93Lg0KPj4gDQo+PiBzdGF0aWMgdm9pZCBjZl9jaGVjaw0KPj4gYTY1M3NjaGVkX2RvX3NjaGVk
dWxlKA0KPj4gICAgICBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91
bml0ICpwcmV2LCBzX3RpbWVfdA0KPj4gICAgICBub3csIGJvb2wgdGFza2xldF93b3JrX3NjaGVk
dWxlZCkgeyBzdHJ1Y3Qgc2NoZWRfdW5pdCAqbmV3X3Rhc2sgPQ0KPj4gICAgICBOVUxMOyBzdGF0
aWMgdW5zaWduZWQgaW50IHNjaGVkX2luZGV4ID0gMDsgICAgPD09IHN0YXRpYyBzX3RpbWVfdA0K
Pj4gICAgICBuZXh0X3N3aXRjaF90aW1lOyAgICAgICA8PT0NCj4gDQo+IFRoYW5rcyBmb3IgdGhl
IHJlcG9ydCENCj4gDQo+IENvdWxkIHlvdSBwbGVhc2UgdmVyaWZ5IHRoZSBhdHRhY2hlZCBwYXRj
aCBpcyBmaXhpbmcgeW91ciBwcm9ibGVtPw0KPiANCj4gQW5kIHBsZWFzZSB0ZWxsIG1lIHdoZXRo
ZXIgYWRkaW5nIHlvdSBhcyAiUmVwb3J0ZWQtYnk6IiBpcyBmaW5lIHdpdGggeW91IQ0KPiANCj4g
SnVlcmdlbg0KDQpUaGFua3MgZm9yIHRoZSBxdWljayBwYXRjaC4gSSBoYXZlIHZlcmlmaWVkIHRo
ZSBwYXRjaCBmaXhlcyB0aGUgaXNzdWUgYW5kIEkgY2FuIHNlZSBkb21haW5zIGFyZSBydW5uaW5n
IGF0IHRoZSBwcm9ncmFtbWVkIGludGVydmFsLg0KDQpBbmQgSSBhbSB0b3RhbGx5IGZpbmUgd2l0
aCAiUmVwb3J0ZWQtYnkiLg0KDQpNYXkgSSBrbm93IHdoZW4geW91IHRoaW5rIGl0IHdvdWxkIGJl
IG1haW5saW5lZD8gQW5kIHdpbGwgaXQgYmUgYXBwbGllZCB0byBhbGwgYnJhbmNoZXMsIGxpa2Ug
NC4xOSBhbmQgNC4yMD8NCg0KUmVnYXJkcywNCkFuZGVyc29uDQoNCg0K

