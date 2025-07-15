Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CBEB0639C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 17:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044507.1414589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubi1b-0001rD-Fb; Tue, 15 Jul 2025 15:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044507.1414589; Tue, 15 Jul 2025 15:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubi1b-0001of-CM; Tue, 15 Jul 2025 15:56:59 +0000
Received: by outflank-mailman (input) for mailman id 1044507;
 Tue, 15 Jul 2025 15:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9M91=Z4=boeing.com=matthew.l.weber3@srs-se1.protection.inumbo.net>)
 id 1ubi1Z-0001oZ-77
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 15:56:57 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52ec654b-6194-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 17:56:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56FFuoxQ009641; Tue, 15 Jul 2025 11:56:50 -0400
Received: from XCH16-08-08.nos.boeing.com (xch16-08-08.nos.boeing.com
 [144.115.66.116])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56FFuX7c009330
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 15 Jul 2025 11:56:33 -0400
Received: from XCH16-05-12.nos.boeing.com (144.115.66.96) by
 XCH16-08-08.nos.boeing.com (144.115.66.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Tue, 15 Jul 2025 08:56:32 -0700
Received: from XCH19-EDGE-C02.nos.boeing.com (130.76.144.198) by
 XCH16-05-12.nos.boeing.com (144.115.66.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Tue, 15 Jul 2025 08:56:32 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.176)
 by boeing.com (130.76.144.198) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 15 Jul
 2025 08:56:16 -0700
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by SA1P110MB0991.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:172::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 15 Jul
 2025 15:56:10 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519%6]) with mapi id 15.20.8922.025; Tue, 15 Jul 2025
 15:56:10 +0000
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
X-Inumbo-ID: 52ec654b-6194-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1752595010;
	bh=vQYw6RupPuRIvP5Qo429xSoVayXvab8bd/I2AAA9QEU=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=KyHO0n9QTFnr/Aj7w6kPPJmhzsSQrqrAuFEyswbbOitxxhGptx6QDM4wfRmyPaa/P
	 jw+oUzUqrXnbDNqB+BQ9Pnh2xkwWU0s1h8Zxi+2VvT2YVEPm8HlFa9HkuvBasVLHz7
	 SSec2XuFJvNTu4bFueWvQa1cFHqq17FraRlzZwfOe2PxtNEUJAOWAPY3V550pLRVho
	 xdH42H6pOCKbuxYP6hakFdd1ky2Yma7y6Q6xZwc7vEKNMDoPYzKGPw18V5d/HNcA40
	 qn66MevvzBgavUc8xwEhY5wd8voRrCRHmojGsHEYxjlv/U/lIRS0VzIjwqi5raYxT8
	 xoWwoinx64tgQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=nzFZ14FSyKCSs/818/3nE1y2kwW5rBRK/DnywmgOC/dbTO4+Sh80lrXn9xyFJ3M4bhjscHCawNyKbOAE51LdePjvxTcx75f/oggeAFn9jY+G4kqyNY0qKM/h8DhGAs8500M32TlAvQrlQ4EsajglGwtNUe28ueUz9bpx0J+c8AoY0uHL8ugJG50e0U8oNOeiHuOzg4DD5x7lVq2rS6q/IKMsK8y+XqGmsus3hi/lB8P364UpCoF3cDSJ8MqyARJmS5ax3+7D/DX2LdOeA32NwbGJjTzrkoqmWwQyZLOP3JmzFHPdwJtZumaitzPvukv4mJCwXLiMWv/zp1nYksv1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQYw6RupPuRIvP5Qo429xSoVayXvab8bd/I2AAA9QEU=;
 b=cEy4wv2lVumr6OfhEO+ZS0qNiJF6vexyUM6EJd6BEvsN85xeZnRIpnf5eBRmJXbP39BB46BAWcwqmCi16AJaQNte8SepBTyBHzmi9kgU/20CvcC9RUDYzZ0HfJJ+eVCaKZsEzp1IH0AlhzRlMFO9LcFpol6jpEoTt2eJPTicFy273yntxXj+lMWK/O7h5GGqkY9L2/KkT+81upZv/V+2Sr/bHMor1bxcbHfdBbHNa5/nsEgze66KnKf7vz4NMT7HFpYYyFx5JD+PcAQ2A9xZdPHQaWfmxMvDe1wKLqA7fGvRnYHzvAuWv7y35J5QGW+Ds6Ppt5lvnjfnczboiBKT0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQYw6RupPuRIvP5Qo429xSoVayXvab8bd/I2AAA9QEU=;
 b=DUqzwTIPvezQ7D+Bctq3GJCYPs50ytTRGCp8AurkGbP3oZIKlhv5QppvYuo8uS8tLgwh8nyDxg/R5MrACcm+mw/k2U/aL5ERfQpqgIvySXQThLHzth99UdIS7JuTZSOCzvUYrCZsDG+62xqbiAKArI7cwWrG1UEB3fHQqpJnUac=
From: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
To: "Halder, Ayan Kumar" <ayan.kumar.halder@amd.com>,
        "Stabellini, Stefano"
	<stefano.stabellini@amd.com>,
        "Orzel, Michal" <Michal.Orzel@amd.com>,
        "Andryuk, Jason" <Jason.Andryuk@amd.com>,
        "Garcia Vallejo, Alejandro"
	<Alejandro.GarciaVallejo@amd.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: Xen FuSa Upstream meeting
Thread-Topic: Xen FuSa Upstream meeting
Thread-Index: AQHb2spkBFq0sswRq0Sq5hHhc3lcMbQylVDQgABvB4CAAHtAIIAADJ/w
Date: Tue, 15 Jul 2025 15:56:10 +0000
Message-ID: <BN0P110MB2067352A27047E225E661D46F357A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
References: <PH8PR12MB7326CD9FC34003205B37FBE2BC122@PH8PR12MB7326.namprd12.prod.outlook.com>
 <BN0P110MB2067BFB5E6870C738FEC8F99F375A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB20673DB329FA51DD29773BB9F357A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
 <PH8PR12MB7326F2B61DBAB3A335B95093BC57A@PH8PR12MB7326.namprd12.prod.outlook.com>
 <BN0P110MB2067537CFB8CE5FEE5292E39F357A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB2067537CFB8CE5FEE5292E39F357A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: xen-devel@lists.xenproject.org
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-15T07:10:59.2558383Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|SA1P110MB0991:EE_
x-ms-office365-filtering-correlation-id: fffa24c1-545b-4e2b-f493-08ddc3b81e5f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|13003099007|4053099003|4013099003|7053199007|38070700018|8096899003|921020;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?Ij8zGISMmRXTTz326IPWbmDpZSSxCe7gfLrilII91rUxghDCOi4QA5Xs5v?=
 =?iso-8859-2?Q?3/+94+cN8R4PHhokg361bYoXpsP6eAXh6cjBnaj9Acia9f3f4p4zdL/xkk?=
 =?iso-8859-2?Q?2rQP3l+bkw9danL8ZsDbIXSTIpyr6iobjnzjOpETuDoG894VEzAFbNWkqd?=
 =?iso-8859-2?Q?ukaEnjIigKw3tLqRW9FFGbdMDiSU+1RIapF2DsFfO6BzEV9OozKHuakmK/?=
 =?iso-8859-2?Q?Ck0CEyvNy5n/fx9gyKFyNHJ+wgY6YTh0kuQcGqMDzhzVBEwA+dAbNvovkM?=
 =?iso-8859-2?Q?uK9/FJ1URgrP4m+ob9LZ131t1EHKXxFLDlt/4jxJDUYdl14T7VZMXcEqyO?=
 =?iso-8859-2?Q?iakg+qMxQngJud6LEId7QeegO0A1h5J0ep1DzvyG5i1MFsxhPnnjyOl+6u?=
 =?iso-8859-2?Q?wApCj6WDYV2ueT+7QMZWbVkmn8nyfMG71xB7DMtT4Rvq/v/VCdUM/ruy5u?=
 =?iso-8859-2?Q?2tdDVf4/qIXbCjK8V1CGfciAswey3Phmm6WqVZLSDiCS02ezHLHb2bIznA?=
 =?iso-8859-2?Q?c/63Ky8No9mxM2ye/cXfXTHLxa1R8mV6ni4vohUuKYUw3c20hlloFJ+Sgj?=
 =?iso-8859-2?Q?gixcF0cFDWfBWnyIszPh/ZvLUE/gDjhr6ZgswiuBcRw884bJA1+2yxtDNm?=
 =?iso-8859-2?Q?Ea5zfxrdw6mub3M1agAWL57AhrjEgLsR5yhbXGLkUd8AJ1o6COl/9wt3QM?=
 =?iso-8859-2?Q?56LHahRcTIcAVp4THmAwHFeayZ3hlObLbLNSwu2uceVXwmBP2pvrRSLMTC?=
 =?iso-8859-2?Q?Q49asu7TMcRHDMPD2j06FttMZzgcQZ+GfCTc3oxoTwe7hP1WzDcMmzpu3o?=
 =?iso-8859-2?Q?Bdrn3uO9nsUP+7bQB0PEg7wEbuPQxuGfxAnxZvoXcgZfLlu7KrmD27JEaX?=
 =?iso-8859-2?Q?Sxf+oexx3gKKVdAhGdn/wOHm+1shDnloN8nOYJAAXpljj3xJYcoYJhWcl9?=
 =?iso-8859-2?Q?FCiuV4bzAH1XqA+Dxy/ev5EWhFjAfA+vtcipigcMc/5y4E+1OaT0kLNFXy?=
 =?iso-8859-2?Q?NUCi1HAeeNKxbSVO+cLGbSuXk4wBxYin9OL2OSwxkRKq79jjVS28NNx1VP?=
 =?iso-8859-2?Q?PG1vKEmNdnF+vwkLmGgzwDnTOPdmmti9EzRmYRZVQVYRAi2GAR5+AcoVMG?=
 =?iso-8859-2?Q?cQ2hXq9TA7ZVxwoF5loX+vhrNQTVb9g3/iX0EK4AU+WvHqIt9BCdigcgOK?=
 =?iso-8859-2?Q?XmAYOeptvMcNe1n/QtZ0Wlyll7N7YR/oS0ANaNXXz2V3uc7B+DWwN36BtV?=
 =?iso-8859-2?Q?jKhJLtERIHgmuz5Z2w9nweUrLD7x8yCXd2xtMoDTKG/T271DlAMjf5lzQ5?=
 =?iso-8859-2?Q?ySmlMB7FprJHuY6OSVYPwlmS3bXWu+/R0zz1iUGK3LrI1txT0mVw5wCNSG?=
 =?iso-8859-2?Q?PJF7ByOmVsJKRTt2R5Ssg16+Q2DeERbQSS8RUFT9scaRzX8w6yRcIGjPRk?=
 =?iso-8859-2?Q?xPhayLoLGmWB1F3B7bMCtJN6IhMCUEM4EqvmuBy8Zfpdo8iobzOUp/XYOH?=
 =?iso-8859-2?Q?aXX5F09LjTxqzGpQTg+Xwy?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(13003099007)(4053099003)(4013099003)(7053199007)(38070700018)(8096899003)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?fTtmmzwcbGrmqbD+WNBzxtK9rHymeFWw0l5M2/jroqkDmmKNXxUdrM8tQg?=
 =?iso-8859-2?Q?7Fb6qGhzbBv6ZlODShyCHxBTE9g0YKHWTXizZ18zG92coLh5Qpvjt8Np/K?=
 =?iso-8859-2?Q?IdSQD9K7a+ncabc9Z6MYnvQ/g+cUvKXE9NJCZtlZfYg4VGUppNkK6ZZg8O?=
 =?iso-8859-2?Q?zvAlzFAiia2RL5opEKbyrtorKkr9JQNUkIiB0YCeOHb3Qkxi8bsUM6J7Sq?=
 =?iso-8859-2?Q?eHwm6rCtVoVEt9XhvI97Mgjs/InX0QOkMSzmTCYlWN8YIoV2YSvtEVBvOU?=
 =?iso-8859-2?Q?V/1r0ip6VoQFXLUH4LPl3Xz7NsXzAS7GL015gvawnplNvDCHi05d383yf5?=
 =?iso-8859-2?Q?cmJ89BhDqi4Tr+T8+F0bigYyGvDQ1i4uNtMPPfSmluY+Ij1XYzzvc/3E0O?=
 =?iso-8859-2?Q?8iCNz3bCtoVcaRoh0S2XTRFmPGq3R6ufbby66nrjpsF0llcVvMed0zfZyk?=
 =?iso-8859-2?Q?25DblSgkOrk2h5ILLtZn9Q/euVbh8SeazVww0/Jr423P0NVAzhtGcTA/yh?=
 =?iso-8859-2?Q?f20eYpG9UVoaiuN+gl+tCDhIKGqzgR69YKypEeB+mBgTWmr4mJBOz4X5mK?=
 =?iso-8859-2?Q?GfdkURk6+IQKPy8otJHNurJ/dCTpWmo0StdiBtaE98Pt0N5KFIvKqyQZoi?=
 =?iso-8859-2?Q?SMiS7JCtmLyx6eQ8lC+YRH5/njuPd4Qp/4ZU9LQtuItkbMjUpXHTYQtu49?=
 =?iso-8859-2?Q?liL3+XLzo6xtJpOWL0vzqzTmApDCHs/LYd9i31ZGSMBqvPg9wOZ2vjdWDi?=
 =?iso-8859-2?Q?cJlkmrMdY7DHpvgN9rn62tnsyKjvhXEMNmC7gb5XX+I8yhRhUYEEbpu+IU?=
 =?iso-8859-2?Q?23CfbnXUTA09kwUi2BGBImjF35Uy4rQz09aft/9y+l/JJi3OomlYgvBWvH?=
 =?iso-8859-2?Q?QrTZ9i/O6WjW2nyRmO/U3yGYkPi1e15qeNQKAwqxH1lFqiVMR8tXrqvc8+?=
 =?iso-8859-2?Q?So+zmqROpsErPdSaxQ0yZ8SMTpCHZ2frBh/bT54IYS/3Q8ibNUm7og2nsw?=
 =?iso-8859-2?Q?EL9wDN0a5tgGXvbqRm/b6ThH1NoanGtd/yIl9jZqxaj+fO1PMiW/vz1zbE?=
 =?iso-8859-2?Q?MEPNdteD8JqIfRjqZ/7lUMxaooncm0H+YE082XVIu6pEGNZn4CcZwYwYU9?=
 =?iso-8859-2?Q?Kc6LTwsewA5vCSsN8F4wQQz0VGg9xPT6j8anMDVWC0wgfwgGn5+vVINoDZ?=
 =?iso-8859-2?Q?QwSBxh/9/0dhFj3u9A6QkiG8iIuHCGaTbp5zVQmyDML+52AgdoAOofRptU?=
 =?iso-8859-2?Q?Q5QtK3IF1SwfMrzMIIMmnTKEXNLJmFrLzSxqRNbhJdYxH+Y2ZZD8qaerVg?=
 =?iso-8859-2?Q?X4d0ZMp+G6FIj2kc6zVJGnd23e3jsVveFwaVQjSY1r/RxOQH5OSPSIZ+G0?=
 =?iso-8859-2?Q?Py5rDn9JyYyfXvUnH/mzlTwLxxgQbS0X93QjQYbhX1GzEg9xFQcBDxK8Si?=
 =?iso-8859-2?Q?sprxxeGBUhATQp01ulrNyWYcePB3dHIonQlbFGvYrCsi2UGlTP2U47sWdi?=
 =?iso-8859-2?Q?z0ZvEH2pSEPi3fywkBDJVnolCrTBqXwx5HvDYZts2AjxZb1wd7YZ5l0UAp?=
 =?iso-8859-2?Q?y+ooAmANgi6nMEhFSEJe5UwnPc14?=
Content-Type: multipart/related;
	boundary="_005_BN0P110MB2067352A27047E225E661D46F357ABN0P110MB2067NAMP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fffa24c1-545b-4e2b-f493-08ddc3b81e5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 15:56:10.7238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB0991
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

--_005_BN0P110MB2067352A27047E225E661D46F357ABN0P110MB2067NAMP_
Content-Type: multipart/alternative;
	boundary="_000_BN0P110MB2067352A27047E225E661D46F357ABN0P110MB2067NAMP_"

--_000_BN0P110MB2067352A27047E225E661D46F357ABN0P110MB2067NAMP_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Looping the list in  @xen-devel@lists.xenproject.org<mailto:xen-devel@lists=
.xenproject.org>

From: Weber (US), Matthew L
Sent: Tuesday, July 15, 2025 10:16 AM
To: Halder, Ayan Kumar <ayan.kumar.halder@amd.com>; Stabellini, Stefano <st=
efano.stabellini@amd.com>; Orzel, Michal <Michal.Orzel@amd.com>; Andryuk, J=
ason <Jason.Andryuk@amd.com>; Garcia Vallejo, Alejandro <Alejandro.GarciaVa=
llejo@amd.com>
Subject: RE: Xen FuSa Upstream meeting

Thanks Ayan,

I think our DO-178 ARINC cert use case is very simple with a dom0less confi=
guration that doesn't need most/any traditional toolstack provided function=
s.  We need a thin layer on the hypercall interface (dom health management =
stuff, scheduler control) and some pre-population of data in the device tre=
es for domU(s) that expresses static attributes of the domain which usually=
 would have come through xenstore.  Otherwise everything else is static sha=
red memory.

Regards,
Matt

From: Halder, Ayan Kumar <ayan.kumar.halder@amd.com<mailto:ayan.kumar.halde=
r@amd.com>>
Sent: Tuesday, July 15, 2025 2:49 AM
To: Weber (US), Matthew L <matthew.l.weber3@boeing.com<mailto:matthew.l.web=
er3@boeing.com>>; Stabellini, Stefano <stefano.stabellini@amd.com<mailto:st=
efano.stabellini@amd.com>>; Orzel, Michal <Michal.Orzel@amd.com<mailto:Mich=
al.Orzel@amd.com>>; Andryuk, Jason <Jason.Andryuk@amd.com<mailto:Jason.Andr=
yuk@amd.com>>; Garcia Vallejo, Alejandro <Alejandro.GarciaVallejo@amd.com<m=
ailto:Alejandro.GarciaVallejo@amd.com>>
Subject: [EXTERNAL] Re: Xen FuSa Upstream meeting

EXT email: be mindful of links/attachments.



[AMD Official Use Only - AMD Internal Distribution Only]

Hi Matthew/Stefano,

Apologies for missing this.

Michal has summed up the issue as follows :-

Toolstack is out of scope for safety certification. This is mostly because =
large part of the toolstack exist to create/destroy or handle in general ru=
ntime domains. That said there are services like xenstore that may be requi=
red e.g. for PV drivers (Xenbus and Xenstore are needed here). With the int=
roduction of split domain capabilities e.g. separate control, hardware, xen=
store domains it may be challenging  at first to boot hardware or xenstore =
domain with toolstack. This is because the toolstack has a lot of cross dep=
endencies with libraries relying on e.g. control capability. It's not reall=
y possible today to carve out unneeded stuff from the toolstack to only pro=
vide e.g. Xenstored.

We need to have a discussion to understand what approach we should take.

Michal, Jason, Stefano, Alejandro should be present.
Do we need Julien and any other maintainer (Jan) ?

I will be away next week.
Stefano can bring up this topic and record the discussion.

Kind regards,
Ayan

From: Weber (US), Matthew L <matthew.l.weber3@boeing.com<mailto:matthew.l.w=
eber3@boeing.com>>
Date: Tuesday, 15 July 2025 at 02:15
To: Halder, Ayan Kumar <ayan.kumar.halder@amd.com<mailto:ayan.kumar.halder@=
amd.com>>
Subject: RE: Xen FuSa Upstream meeting
Do you take agenda topics for this call?  I wondered about getting feedback=
 on these two topics.

https://old-list-archives.xenproject.org/archives/html/xen-devel/2025-07/ms=
g00531.html

https://old-list-archives.xenproject.org/archives/html/xen-devel/2025-07/ms=
g00564.html

Best Regards,
-
Matthew L. Weber
Associate Technical Fellow / ELISA Aerospace WG Chair
LinkedIn<https://www.linkedin.com/in/matthew-weber-a171527/> | GitHub<https=
://github.com/matthew-l-weber> | GitLab<https://gitlab.com/matthewlweber> |=
 LXF Open Profile<https://openprofile.dev/profile/matthew.l.weber>

[cid:image001.gif@01DBF577.11C2E420]



-----Original Appointment-----
From: Halder, Ayan Kumar <ayan.kumar.halder@amd.com<mailto:ayan.kumar.halde=
r@amd.com>>
Sent: Wednesday, June 11, 2025 7:15 AM
To: Halder, Ayan Kumar; Weber (US), Matthew L; artem_mygaiev@epam.com<mailt=
o:artem_mygaiev@epam.com>; francesco.rossi@resiltech.com<mailto:francesco.r=
ossi@resiltech.com>; Aniket Saha; Mukhin, Denis (D.); NETCHITALIOUK, ANDREI=
 (A.); Kate Stewart; David Ward; Rafa=B3 Misiura; marco.demi@resiltech.com<=
mailto:marco.demi@resiltech.com>; Bertrand Marquis; hisao.munakata.vt@renes=
as.com<mailto:hisao.munakata.vt@renesas.com>; Kim, Haesun; Ahn, Sookyung; r=
oberto.bagnara@bugseng.com<mailto:roberto.bagnara@bugseng.com>; Pawe=B3 Kal=
eta; stefano.dellosa@intel.com<mailto:stefano.dellosa@intel.com>; Ragiadako=
u, Xenia; Hildebrand, Stewart; Orzel, Michal; fusa-sig@lists.xenproject.org=
<mailto:fusa-sig@lists.xenproject.org>
Cc: Luca Fancellu; francesco.brancati@resiltech.com<mailto:francesco.branca=
ti@resiltech.com>; Alex Agizim; Rahul Singh; Robert Heinen; Stabellini, Ste=
fano; Chan King Choy, Nathalie; Lira, Victor M; Iglesias, Edgar; Andryuk, J=
ason; Miccio, Luca; Rafa=B3 Tomaszewski; Andrei Buzdugan; Eugene Nebrat; Pi=
otr Serwa
Subject: FW: Xen FuSa Upstream meeting
When: Tuesday, July 22, 2025 3:00 PM-4:00 PM (UTC+00:00) Dublin, Edinburgh,=
 Lisbon, London.
Where: https://amd.zoom.us/j/92115684076?pwd=3DsKEw5EfYN6KcYhz15mbftYqAyaRm=
8R.1&from=3Daddon

EXT email: be mindful of links/attachments.




From: ayan.kumar.halder@amd.com<mailto:ayan.kumar.halder@amd.com>
When: 15:00 - 16:00 21 January 2025
Subject: Xen FuSa Upstream meeting
Location: https://amd.zoom.us/j/92115684076?pwd=3DsKEw5EfYN6KcYhz15mbftYqAy=
aRm8R.1&from=3Daddon


Hi ,

This is our regular meeting series.

Ayan


[Image removed by sender.]<https://zoom.com/>
Hi there,
Ayan Kumar Halder is inviting you to a scheduled Zoom meeting.
Join Zoom Meeting<https://amd.zoom.us/j/92115684076?pwd=3DsKEw5EfYN6KcYhz15=
mbftYqAyaRm8R.1&from=3Daddon>
One tap mobile:
US: +19292056099,,92115684076#,,,,*1507305560#<tel:+19292056099,,9211568407=
6#,,,,*1507305560#> or +16699006833,,92115684076#,,,,*1507305560#<tel:+1669=
9006833,,92115684076#,,,,*1507305560#>
Meeting URL:
https://amd.zoom.us/j/92115684076?pwd=3DsKEw5EfYN6KcYhz15mbftYqAyaRm8R.1&fr=
om=3Daddon
Meeting ID:
921 1568 4076
Passcode:
yV39aa%pi0
Join by Telephone
For higher quality, dial a number based on your current location.
Dial:
+1 929 205 6099 US (New York)
+1 669 900 6833 US (San Jose)
+1 720 928 9299 US (Denver)
833 928 4610 US Toll-free
877 853 5257 US Toll-free
888 475 4499 US Toll-free
833 548 0276 US Toll-free
833 548 0282 US Toll-free
833 928 4608 US Toll-free
833 928 4609 US Toll-free
+91 406 480 2722 India
+91 446 480 2722 India
+91 806 480 2722 India
+91 80 71 279 440 India
+91 116 480 2722 India
+91 225 097 2744 India
+91 225 097 2745 India
+91 226 480 2722 India
+91 22 71 279 525 India
000 800 919 1676 India Toll-free
000 800 001 4002 India Toll-free
000 800 050 5050 India Toll-free
000 800 050 2340 India Toll-free
000 800 050 2400 India Toll-free
+353 6 163 9031 Ireland
+353 1 536 9320 Ireland
+353 1 653 3895 Ireland
1800 719 875 Ireland Toll-free
1800 901 561 Ireland Toll-free
1800 943 965 Ireland Toll-free
1800 949 238 Ireland Toll-free
+65 3158 7288 Singapore
+65 3165 1065 Singapore
800 852 6054 Singapore Toll-free
1800 407 5602 Singapore Toll-free
800 101 3814 Singapore Toll-free
Meeting ID:
921 1568 4076
Passcode:
1507305560
International numbers<https://amd.zoom.us/u/abjM3BHg8>
Join from an H.323/SIP room system
H.323:
144.195.19.161 (US West)
206.247.11.121 (US East)
221.122.88.195 (Mainland China)
115.114.131.7 (India Mumbai)
115.114.115.7 (India Hyderabad)
159.124.15.191 (Amsterdam Netherlands)
159.124.47.249 (Germany)
159.124.104.213 (Australia Sydney)
159.124.74.212 (Australia Melbourne)
170.114.134.121 (Hong Kong SAR)
170.114.180.219 (Singapore)
64.211.144.160 (Brazil)
159.124.168.213 (Canada Toronto)
159.124.196.25 (Canada Vancouver)
170.114.194.163 (Japan Tokyo)
147.124.100.25 (Japan Osaka)
Meeting ID:
921 1568 4076
Passcode:
1507305560
SIP:
92115684076@zoomcrc.com<mailto:92115684076@zoomcrc.com>
Passcode:
1507305560


--_000_BN0P110MB2067352A27047E225E661D46F357ABN0P110MB2067NAMP_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:10.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;
	mso-ligatures:none;
	mso-fareast-language:EN-GB;}
span.EmailStyle23
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"purple" style=3D"word-wrap:b=
reak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Looping the list in=
&nbsp; <a id=3D"OWAAMD81ABB687FEF4350BB7C5BD343365E81" href=3D"mailto:xen-d=
evel@lists.xenproject.org">
<span style=3D"font-family:&quot;Aptos&quot;,sans-serif;text-decoration:non=
e">@xen-devel@lists.xenproject.org</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Weber (US), Matthew L
<br>
<b>Sent:</b> Tuesday, July 15, 2025 10:16 AM<br>
<b>To:</b> Halder, Ayan Kumar &lt;ayan.kumar.halder@amd.com&gt;; Stabellini=
, Stefano &lt;stefano.stabellini@amd.com&gt;; Orzel, Michal &lt;Michal.Orze=
l@amd.com&gt;; Andryuk, Jason &lt;Jason.Andryuk@amd.com&gt;; Garcia Vallejo=
, Alejandro &lt;Alejandro.GarciaVallejo@amd.com&gt;<br>
<b>Subject:</b> RE: Xen FuSa Upstream meeting<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Thanks Ayan,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">I think our DO-178 =
ARINC cert use case is very simple with a dom0less configuration that doesn=
&#8217;t need most/any traditional toolstack provided functions.&nbsp; We n=
eed a thin layer on the hypercall interface (dom
 health management stuff, scheduler control) and some pre-population of dat=
a in the device trees for domU(s) that expresses static attributes of the d=
omain which usually would have come through xenstore.&nbsp; Otherwise every=
thing else is static shared memory.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Regards,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Matt<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Halder, Ayan Kumar &lt;<a href=
=3D"mailto:ayan.kumar.halder@amd.com">ayan.kumar.halder@amd.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, July 15, 2025 2:49 AM<br>
<b>To:</b> Weber (US), Matthew L &lt;<a href=3D"mailto:matthew.l.weber3@boe=
ing.com">matthew.l.weber3@boeing.com</a>&gt;; Stabellini, Stefano &lt;<a hr=
ef=3D"mailto:stefano.stabellini@amd.com">stefano.stabellini@amd.com</a>&gt;=
; Orzel, Michal &lt;<a href=3D"mailto:Michal.Orzel@amd.com">Michal.Orzel@am=
d.com</a>&gt;;
 Andryuk, Jason &lt;<a href=3D"mailto:Jason.Andryuk@amd.com">Jason.Andryuk@=
amd.com</a>&gt;; Garcia Vallejo, Alejandro &lt;<a href=3D"mailto:Alejandro.=
GarciaVallejo@amd.com">Alejandro.GarciaVallejo@amd.com</a>&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: Xen FuSa Upstream meeting<o:p></o:p></span><=
/p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellpadding=3D"0" width=3D"100=
%" style=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"background:white;padding:.75pt .75pt .75pt .75pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"left" width=3D"100%" style=3D"width:100.0%;margin-left:.75p=
t;margin-right:.75pt">
<tbody>
<tr>
<td style=3D"background:#910A19;padding:5.25pt 1.5pt 5.25pt 1.5pt"></td>
<td width=3D"100%" style=3D"width:100.0%;background:#FDF2F4;padding:5.25pt =
3.75pt 5.25pt 11.25pt">
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;mso-element:frame;mso-element-frame-hspace:2.25pt;mso-element-wrap:=
around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:=
column;mso-height-rule:exactly">
<span style=3D"font-family:&quot;Verdana&quot;,sans-serif;color:#212121">EX=
T email: be mindful of links/attachments.</span><span style=3D"font-size:12=
.0pt"><o:p></o:p></span></p>
</div>
</td>
</tr>
</tbody>
</table>
<pre><span style=3D"color:black"><br>&nbsp;<o:p></o:p></span></pre>
</td>
</tr>
</tbody>
</table>
<p style=3D"margin:5.0pt"><span lang=3D"EN-GB" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif;color:blue">[AMD Official Use Only=
 - AMD Internal Distribution Only]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt">Hi M=
atthew/Stefano,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt">Apol=
ogies for missing this.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt">Mich=
al has summed up the issue as follows :-<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#1D1C1D;background:#F8F8F8">Tools=
tack is out of scope for safety certification. This is mostly because large=
 part of the toolstack exist to create/destroy or
 handle in general runtime domains. That said there are services like xenst=
ore that may be required e.g. for PV drivers (Xenbus and Xenstore are neede=
d here). With the introduction of split domain capabilities e.g. separate c=
ontrol, hardware, xenstore domains
 it may be challenging&nbsp; at first to boot hardware or xenstore domain w=
ith toolstack. This is because the toolstack has a lot of cross dependencie=
s with libraries relying on e.g. control capability. It's not really possib=
le today to carve out unneeded stuff
 from the toolstack to only provide e.g. Xenstored.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#1D1C1D;background:#F8F8F8"><o:p>=
&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#1D1C1D;background:#F8F8F8">We ne=
ed to have a discussion to understand what approach we should take.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#1D1C1D;background:#F8F8F8"><o:p>=
&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#1D1C1D;background:#F8F8F8">Micha=
l, Jason, Stefano, Alejandro should be present.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#1D1C1D;background:#F8F8F8">Do we=
 need Julien and any other maintainer (Jan) ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt">I wi=
ll be away next week.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt">Stef=
ano can bring up this topic and record the discussion.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt">Kind=
 regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt">Ayan=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Weber (US), Matthew=
 L &lt;<a href=3D"mailto:matthew.l.weber3@boeing.com">matthew.l.weber3@boei=
ng.com</a>&gt;<br>
<b>Date: </b>Tuesday, 15 July 2025 at 02:15<br>
<b>To: </b>Halder, Ayan Kumar &lt;<a href=3D"mailto:ayan.kumar.halder@amd.c=
om">ayan.kumar.halder@amd.com</a>&gt;<br>
<b>Subject: </b>RE: Xen FuSa Upstream meeting<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Do you take agenda =
topics for this call?&nbsp; I wondered about getting feedback on these two =
topics.</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;</span><span =
style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><a href=3D"https://=
old-list-archives.xenproject.org/archives/html/xen-devel/2025-07/msg00531.h=
tml">https://old-list-archives.xenproject.org/archives/html/xen-devel/2025-=
07/msg00531.html</a></span><span style=3D"font-size:11.0pt"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;</span><span =
style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><a href=3D"https://=
old-list-archives.xenproject.org/archives/html/xen-devel/2025-07/msg00564.h=
tml">https://old-list-archives.xenproject.org/archives/html/xen-devel/2025-=
07/msg00564.html</a></span><span style=3D"font-size:11.0pt"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;</span><span =
style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Best Regards,</span=
><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:#5B6770">&#821=
2;</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Arial&quot;,sans=
-serif;color:#5B6770">Matthew L. Weber</span></b><span style=3D"font-size:1=
1.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:#5B6770">Associate Technical Fellow / ELISA Aerospace WG Chair</s=
pan><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><a href=3D"https://=
www.linkedin.com/in/matthew-weber-a171527/"><span style=3D"font-size:10.0pt=
;font-family:&quot;Arial&quot;,sans-serif">LinkedIn</span></a></span><span =
style=3D"font-family:&quot;Arial&quot;,sans-serif;color:black">
 | </span><span style=3D"font-size:12.0pt"><a href=3D"https://github.com/ma=
tthew-l-weber"><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,sans-serif">GitHub</span></a></span><span style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:black"> |
</span><span style=3D"font-size:12.0pt"><a href=3D"https://gitlab.com/matth=
ewlweber"><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,san=
s-serif">GitLab</span></a></span><span style=3D"font-family:&quot;Arial&quo=
t;,sans-serif;color:black"> |
</span><span style=3D"font-size:12.0pt"><a href=3D"https://openprofile.dev/=
profile/matthew.l.weber"><span style=3D"font-size:10.0pt;font-family:&quot;=
Arial&quot;,sans-serif">LXF Open Profile</span></a></span><span style=3D"fo=
nt-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Hel=
vetica&quot;,sans-serif;color:black">&nbsp;</span><span style=3D"font-size:=
11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><img border=3D"0" w=
idth=3D"142" height=3D"32" style=3D"width:1.4791in;height:.3333in" id=3D"Pi=
cture_x0020_1998191489" src=3D"cid:image001.gif@01DBF577.11C2E420"></span><=
span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;</span><span =
style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;</span><span =
style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;</span><span =
style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">-----Original Appointment-----<br>
<b>From:</b> Halder, Ayan Kumar &lt;<a href=3D"mailto:ayan.kumar.halder@amd=
.com">ayan.kumar.halder@amd.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, June 11, 2025 7:15 AM<br>
<b>To:</b> Halder, Ayan Kumar; Weber (US), Matthew L; <a href=3D"mailto:art=
em_mygaiev@epam.com">
artem_mygaiev@epam.com</a>; <a href=3D"mailto:francesco.rossi@resiltech.com=
">francesco.rossi@resiltech.com</a>; Aniket Saha; Mukhin, Denis (D.); NETCH=
ITALIOUK, ANDREI (A.); Kate Stewart; David Ward; Rafa=B3 Misiura;
<a href=3D"mailto:marco.demi@resiltech.com">marco.demi@resiltech.com</a>; B=
ertrand Marquis;
<a href=3D"mailto:hisao.munakata.vt@renesas.com">hisao.munakata.vt@renesas.=
com</a>; Kim, Haesun; Ahn, Sookyung;
<a href=3D"mailto:roberto.bagnara@bugseng.com">roberto.bagnara@bugseng.com<=
/a>; Pawe=B3 Kaleta;
<a href=3D"mailto:stefano.dellosa@intel.com">stefano.dellosa@intel.com</a>;=
 Ragiadakou, Xenia; Hildebrand, Stewart; Orzel, Michal;
<a href=3D"mailto:fusa-sig@lists.xenproject.org">fusa-sig@lists.xenproject.=
org</a><br>
<b>Cc:</b> Luca Fancellu; <a href=3D"mailto:francesco.brancati@resiltech.co=
m">francesco.brancati@resiltech.com</a>; Alex Agizim; Rahul Singh; Robert H=
einen; Stabellini, Stefano; Chan King Choy, Nathalie; Lira, Victor M; Igles=
ias, Edgar; Andryuk, Jason; Miccio,
 Luca; Rafa=B3 Tomaszewski; Andrei Buzdugan; Eugene Nebrat; Piotr Serwa<br>
<b>Subject:</b> FW: Xen FuSa Upstream meeting<br>
<b>When:</b> Tuesday, July 22, 2025 3:00 PM-4:00 PM (UTC+00:00) Dublin, Edi=
nburgh, Lisbon, London.<br>
<b>Where:</b> <a href=3D"https://amd.zoom.us/j/92115684076?pwd=3DsKEw5EfYN6=
KcYhz15mbftYqAyaRm8R.1&amp;from=3Daddon">
https://amd.zoom.us/j/92115684076?pwd=3DsKEw5EfYN6KcYhz15mbftYqAyaRm8R.1&am=
p;from=3Daddon</a></span><span style=3D"font-size:11.0pt"><o:p></o:p></span=
></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellpadding=3D"0" width=3D"100=
%" style=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"background:white;padding:.75pt .75pt .75pt .75pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"left" width=3D"100%" style=3D"width:100.0%;margin-left:.75p=
t;margin-right:.75pt">
<tbody>
<tr>
<td style=3D"background:#910A19;padding:5.25pt 1.5pt 5.25pt 1.5pt"></td>
<td width=3D"100%" style=3D"width:100.0%;background:#FDF2F4;padding:5.25pt =
3.75pt 5.25pt 11.25pt">
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Verdana&quot;,sans-=
serif;color:#212121">EXT email: be mindful of links/attachments.</span><spa=
n style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</div>
</td>
</tr>
</tbody>
</table>
<pre><span style=3D"color:black"><br>&nbsp;</span><o:p></o:p></pre>
</td>
</tr>
</tbody>
</table>
<div>
<p style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
</div>
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:black">From:
</span></b><span style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,=
sans-serif;color:black"><a href=3D"mailto:ayan.kumar.halder@amd.com">ayan.k=
umar.halder@amd.com</a><br>
<b>When: </b>15:00 - 16:00 21 January 2025 <br>
<b>Subject: </b>Xen FuSa Upstream meeting<br>
<b>Location: </b><a href=3D"https://amd.zoom.us/j/92115684076?pwd=3DsKEw5Ef=
YN6KcYhz15mbftYqAyaRm8R.1&amp;from=3Daddon">https://amd.zoom.us/j/921156840=
76?pwd=3DsKEw5EfYN6KcYhz15mbftYqAyaRm8R.1&amp;from=3Daddon</a></span><span =
style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Times New Roman&quo=
t;,serif">&nbsp;</span><span style=3D"font-size:11.0pt"><o:p></o:p></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Times New Roman&quo=
t;,serif">&nbsp;</span><span style=3D"font-size:11.0pt"><o:p></o:p></span><=
/p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi , <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This is our regular=
 meeting series.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Ayan<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" id=3D"zBegin"><span style=3D"font-size:11.0pt">&nbsp=
;<o:p></o:p></span></p>
<div align=3D"center">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"100%" style=3D"width:100.0%;background:#F4F5F9">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0in 0in 0in 0in">
<div align=3D"center">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"592" style=3D"width:444.0pt">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0in 0in 0in 0in">
<div align=3D"center">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"100%" style=3D"width:100.0%;background:white">
<tbody>
<tr>
<td style=3D"background:#F4F5F9;padding:22.5pt 0in 7.5pt 0in">
<p class=3D"MsoNormal"><span style=3D"color:black"><a href=3D"https://zoom.=
com/"><span style=3D"font-size:12.0pt;border:solid windowtext 1.0pt;padding=
:0in;text-decoration:none"><img border=3D"0" width=3D"110" height=3D"25" st=
yle=3D"width:1.1458in;height:.2604in" id=3D"Picture_x0020_1" src=3D"cid:ima=
ge002.jpg@01DBF577.11C2E420" alt=3D"Image removed by sender."></span></a></=
span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0in 21.0pt 27.75pt 21.0pt">
<div align=3D"center">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td colspan=3D"2" valign=3D"top" style=3D"padding:42.75pt 0in 7.5pt 0in">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:#39394D">Hi there,</span><span style=3D"font-size:11.0pt"><o:p></=
o:p></span></p>
</td>
</tr>
<tr>
<td colspan=3D"2" valign=3D"top" style=3D"padding:0in 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"line-height:18.75pt"><span style=3D"font-fa=
mily:&quot;Arial&quot;,sans-serif;color:#39394D">Ayan Kumar Halder is invit=
ing you to a scheduled Zoom meeting.
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"background:white;padding:15.0pt 0in 6.0pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:25.5pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D"><a href=3D"https://amd.zoom=
.us/j/92115684076?pwd=3DsKEw5EfYN6KcYhz15mbftYqAyaRm8R.1&amp;from=3Daddon">=
<span style=3D"font-size:19.0pt;color:#2D8CFF">Join Zoom Meeting</span></a>
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr style=3D"height:13.5pt">
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in;height:13.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">One tap mobile:
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 3.75pt 0in;height:13.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">US:
<a href=3D"tel:+19292056099,,92115684076#,,,,*1507305560#">+19292056099,,92=
115684076#,,,,*1507305560#</a> or
<a href=3D"tel:+16699006833,,92115684076#,,,,*1507305560#">+16699006833,,92=
115684076#,,,,*1507305560#</a>
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr style=3D"height:13.5pt">
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in;height:13.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">Meeting URL:
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 0in 0in;height:13.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D"><a href=3D"https://amd.zoom=
.us/j/92115684076?pwd=3DsKEw5EfYN6KcYhz15mbftYqAyaRm8R.1&amp;from=3Daddon">=
<span style=3D"color:#39394D">https://amd.zoom.us/j/92115684076?pwd=3DsKEw5=
EfYN6KcYhz15mbftYqAyaRm8R.1&amp;from=3Daddon</span></a>
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr style=3D"height:13.5pt">
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in;height:13.5pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:#39394D">Meeting ID:
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 0in 0in;height:13.5pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:#39394D">921 1568 4076</span><span style=3D"font-size:11.0pt"><o:=
p></o:p></span></p>
</td>
</tr>
<tr style=3D"height:13.5pt">
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in;height:13.5pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:#39394D">Passcode:</span><span style=3D"font-size:11.0pt"><o:p></=
o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 0in 0in;height:13.5pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:#39394D">yV39aa%pi0</span><span style=3D"font-size:11.0pt"><o:p><=
/o:p></span></p>
</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"padding:15.0pt 0in 6.75pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:18.75pt"><b><span style=3D"font=
-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#39394D">Join b=
y Telephone
</span></b><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td colspan=3D"2" valign=3D"top" style=3D"padding:0in 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">For higher quality, dial a =
number based on your current location.
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">Dial:
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 7.5pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">+1 929 205 6099 US (New Yor=
k)<br>
+1 669 900 6833 US (San Jose)<br>
+1 720 928 9299 US (Denver)<br>
833 928 4610 US Toll-free<br>
877 853 5257 US Toll-free<br>
888 475 4499 US Toll-free<br>
833 548 0276 US Toll-free<br>
833 548 0282 US Toll-free<br>
833 928 4608 US Toll-free<br>
833 928 4609 US Toll-free<br>
+91 406 480 2722 India<br>
+91 446 480 2722 India<br>
+91 806 480 2722 India<br>
+91 80 71 279 440 India<br>
+91 116 480 2722 India<br>
+91 225 097 2744 India<br>
+91 225 097 2745 India<br>
+91 226 480 2722 India<br>
+91 22 71 279 525 India<br>
000 800 919 1676 India Toll-free<br>
000 800 001 4002 India Toll-free<br>
000 800 050 5050 India Toll-free<br>
000 800 050 2340 India Toll-free<br>
000 800 050 2400 India Toll-free<br>
+353 6 163 9031 Ireland<br>
+353 1 536 9320 Ireland<br>
+353 1 653 3895 Ireland<br>
1800 719 875 Ireland Toll-free<br>
1800 901 561 Ireland Toll-free<br>
1800 943 965 Ireland Toll-free<br>
1800 949 238 Ireland Toll-free<br>
+65 3158 7288 Singapore<br>
+65 3165 1065 Singapore<br>
800 852 6054 Singapore Toll-free<br>
1800 407 5602 Singapore Toll-free<br>
800 101 3814 Singapore Toll-free</span><span style=3D"font-size:11.0pt"><o:=
p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">Meeting ID:
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 7.5pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">921 1568 4076</span><span s=
tyle=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">Passcode:
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 7.5pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">1507305560</span><span styl=
e=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td colspan=3D"2" valign=3D"top" style=3D"padding:0in 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D"><a href=3D"https://amd.zoom=
.us/u/abjM3BHg8"><span style=3D"color:#39394D">International numbers</span>=
</a></span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"padding:15.0pt 0in 6.75pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:18.75pt"><b><span style=3D"font=
-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#39394D">Join f=
rom an H.323/SIP room system
</span></b><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">H.323:
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 3.75pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">144.195.19.161 (US West)<br=
>
206.247.11.121 (US East)<br>
221.122.88.195 (Mainland China)<br>
115.114.131.7 (India Mumbai)<br>
115.114.115.7 (India Hyderabad)<br>
159.124.15.191 (Amsterdam Netherlands)<br>
159.124.47.249 (Germany)<br>
159.124.104.213 (Australia Sydney)<br>
159.124.74.212 (Australia Melbourne)<br>
170.114.134.121 (Hong Kong SAR)<br>
170.114.180.219 (Singapore)<br>
64.211.144.160 (Brazil)<br>
159.124.168.213 (Canada Toronto)<br>
159.124.196.25 (Canada Vancouver)<br>
170.114.194.163 (Japan Tokyo)<br>
147.124.100.25 (Japan Osaka)</span><span style=3D"font-size:11.0pt"><o:p></=
o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">Meeting ID:
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 3.75pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">921 1568 4076</span><span s=
tyle=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">Passcode:
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 3.75pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">1507305560</span><span styl=
e=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">SIP:
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 3.75pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D"><a href=3D"mailto:921156840=
76@zoomcrc.com">92115684076@zoomcrc.com</a>
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"22%" valign=3D"top" style=3D"width:22.0%;padding:0in 0in 0in 0=
in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">Passcode:
</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0in 0in 3.75pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#39394D">1507305560</span><span styl=
e=3D"font-size:11.0pt"><o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
<p class=3D"MsoNormal" id=3D"zEnd"><span style=3D"font-size:11.0pt">&nbsp;<=
o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BN0P110MB2067352A27047E225E661D46F357ABN0P110MB2067NAMP_--

--_005_BN0P110MB2067352A27047E225E661D46F357ABN0P110MB2067NAMP_
Content-Type: image/gif; name="image001.gif"
Content-Description: image001.gif
Content-Disposition: inline; filename="image001.gif"; size=3118;
	creation-date="Tue, 15 Jul 2025 15:56:09 GMT";
	modification-date="Tue, 15 Jul 2025 15:56:09 GMT"
Content-ID: <image001.gif@01DBF577.11C2E420>
Content-Transfer-Encoding: base64

R0lGODlhjgAgAPcAAL/N6Z+03v7+/z9pvd/m9A9Erfz9/gI6qQk/q/j6/QE5qLLD5Yeh1hdKsPn6
/QY9qiRUtOfs9wM6qRFFru7y+RtNsfP2+/f5/PDz+khwwYii1pWs2wxBrMDO6uLo9f39/iBRs1N5
xDlku/b4/Ctat56z3uzw+Q1CrBZJsJeu3D5ovY+o2RlMseDn9GiJy+nu91B2wx5PsgU8qurv+HKR
z/v8/hBErQpAqzVhutjh8sbT7O3x+SJTtBJGrs/a79Td8AQ7qdLc8NPd8PX3/LDB5G+Pztzk8ylY
tipZtouk12qLzH2a0/r7/aO34KG23/L1+7zL6Jmv3GyMzcrW7cvW7XqX0tHb70xzwh9Qs6q94gg+
q9fg8ai74eHo9V+CyBxOsu/z+ll9xidWtRRIr67A46u94sPQ67XF5mCDyURtvyxat3ST0M3Y7rvK
6HWT0EBqvmGEyRhLsJSr2pat20pywVp+x7fH5jRhurTE5evv+AtBrEFrvqK2352z3snV7TFeuTpl
vNri8uXr9k10wrbG5kVuwE51w9Da79Xe8ePp9Zyy3R1Psr7M6RVIr/H0+gc9qrrJ5+br9tvj8zBd
uH6a01F3xImj1y1bt0dvwCNTtM7Z7kNsv2uMzczX7tbf8VR6xV6ByFZ7xYSf1d3k81h9xsTR6xNH
rsfT7Nnh8t7l9HyZ0vT2+4qk14Oe1WWHymeIy3OSz46n2Dhku+jt9zJfua2/46m84qC130ZvwCZW
tT1ovW6OznuY0kJsv7HC5EtzwrPE5ZCo2Zux3Yyl2CFSs1t/x6y+4zZiuniW0Yah1k92w8LP6m2N
zcHP6jtmvJOr2pqw3YCc1JKq2pGp2X+b03CPzmKEyVJ4xOTq9nGQz6e64QA4qP///wAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94
cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1w
bWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4z
LWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4
bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8
cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5j
b20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0v
IiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNl
UmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1w
TU06SW5zdGFuY2VJRD0ieG1wLmlpZDozQUU2MjY4OEE2NEUxMUU0ODY0NkMwM0ZCMjJGNkY4QSIg
eG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozQUU2MjY4OUE2NEUxMUU0ODY0NkMwM0ZCMjJGNkY4
QSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjNBRTYyNjg2
QTY0RTExRTQ4NjQ2QzAzRkIyMkY2RjhBIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjNBRTYy
Njg3QTY0RTExRTQ4NjQ2QzAzRkIyMkY2RjhBIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpS
REY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s
6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSz
srGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6
eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JB
QD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkI
BwYFBAMCAQAAIfkEAAAAAAAsAAAAAI4AIAAACP8AuQkcSLCgwRoL8hhcyLChw4cQI0qcSLGiD04m
KmrcyLGjR44fGIS58LGkyZMoBxLIEkvUszYYBM4oVMxAyps4czK8IA3Jtm0ICkjYBuRXgBguBOhc
yhRlB2IKrnARJLCGkGEotqGY0bSrV41RDtw5tDDFgQwFFuXw6AeA27dw3bJRWpCAmbhxZxXsghdv
F4ECmsVNpRKukIKe3gYhOMJK37c6mAjksw2Ug4UMtlUyIClTg0Qcy/wcTbr0LoJEfJZejeCwwB1Y
VpduEEFgZtIT/nJ7wYL0EYI/bvyU0EGghWonZJdOw22LFhg2DWZWkUBgiwaAPmgMxEH5ajUDLXn/
Xy0MMJ3x2w4AENhhKOkzAg1sWp2Rm4UjozUIxKAG/Wgg3GRQgSMLabCNGBQQhMc2JVQ0wiWlheDW
Gqv1IdAZpR1giVs8lPbFDgIlU1oPhMSliUARxFFaFQMtIZsvAoUx2iBKCQBDaSQsAEAKq9HABoML
KbJND5IYhAkEdEmERmliPMENBaqN5oV1E5TGgEBklCaDDgIBcABpChDCkAFvlLZHdHYoIJsb3Gww
GggJcpNEaTaMIpAGA+SZZxhM0GBDdQXhccABUCy0wDZTTNTHahAMoMIYpWVwmQM4lHaFUkYUUNoK
KDZQGgd65umFdtxUUVoctXHjgSnKiTDFAz89/0CFQGa4NxoRD9HyiUE/JJfETkCwIpEVWvi3jRrQ
RMdJaXByc8EkEcanAnoy+HFhacQJ5IAso2lKmgwgjDaHQLyVxiY3jNhQwLrsVsINAq0UBEaHNDZE
gjUROQIBjnkiUBooA3FR2gOJcuNKaRA4yQ0yI4aapyJUlqafQEWM5owT3tURXy+l6VIDN5F4WhoL
tW2zAUE2blNBfQwNAANEAoRQ2iQkUdAbabwItEV3pJ3MDcakabEYN8BguwxDlFpKl2g/NZKIB8od
YYFALpLWAFU1TEvaHUVwyY0CEwskx0+FEkQSQSKQAtEKA0NBQBB7lIbDZUOQUBoPBBBQhnCkNf/I
DQFVkiZF3oSDKJAUzMYZSHLpQSJQDKvp8YNAaZZGCQGowFFaBS8QtIgSA+XgL+gFYRNMkg2s8ZAO
QBirsgcCleD6NlIIlECl490wOTcCkyarQA+OFs1AdazWxEAiuI7AKQWFQAJggGzzxdQG0ZCGEdzk
sI0tDuXxhbEKKAO7QKUYO8EKdCnhnxM68zyaz9xo/lMhpHLDI2mvEOSFscf4YFAT25hVFH5CBobs
oAAPKIILHgEGh1ghABCMoAQjSIQWGKQTE5wgHxgBKG4MIYMZLCCtJpiFgTxBgizjRgQkeIsOciMB
tQBhBLPgCYaMYAyGwACkNuGQ22wDCwtw4VfthvgVHiVPAWRpyAgqQBoOhCIKiEgSEaeYEwFk4CfX
gEgolGODAbhgGgvQxAukSMUycoQSP1kCGQligSXpYTwn6AEWQPCHNLhAFdrgihn3GBEmZMVfb4AE
GS0whwo8QA6d2EATFtABHxjBA2AQIh8nSZFDbWMFxsiFVj6xBmpkAxf+ogMiKEnKlCxpGwTghgDa
AAsR8GACEMCEKNZSylqaBHKNMMgqYmLLXpYEAz+BQEF88CtfGrMjBPiJDCKxnypI6pjQ1MgMRpMJ
GoTgBoYYQjS3SZE/kOYRDKgfN8fpEDaIYRsxYEYqycnOhgQEADsAAA==

--_005_BN0P110MB2067352A27047E225E661D46F357ABN0P110MB2067NAMP_
Content-Type: image/jpeg; name="image002.jpg"
Content-Description: image002.jpg
Content-Disposition: inline; filename="image002.jpg"; size=823;
	creation-date="Tue, 15 Jul 2025 15:56:09 GMT";
	modification-date="Tue, 15 Jul 2025 15:56:10 GMT"
Content-ID: <image002.jpg@01DBF577.11C2E420>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0a
HBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIy
MjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCABkAGQDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3+iii
gAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA
CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK
KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo
ooAKKKKACiiigAooooAKKKKACiiigD//2Q==

--_005_BN0P110MB2067352A27047E225E661D46F357ABN0P110MB2067NAMP_--


