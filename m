Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA929E6679
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849508.1264198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQEV-0006eK-6K; Fri, 06 Dec 2024 04:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849508.1264198; Fri, 06 Dec 2024 04:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQEV-0006ch-0s; Fri, 06 Dec 2024 04:46:27 +0000
Received: by outflank-mailman (input) for mailman id 849508;
 Fri, 06 Dec 2024 04:46:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ODA6=S7=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tJQET-0006c5-3S
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:46:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2613::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b93481b-b38d-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:46:24 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB10089.eurprd03.prod.outlook.com
 (2603:10a6:102:360::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 04:46:21 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 04:46:20 +0000
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
X-Inumbo-ID: 0b93481b-b38d-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0cYZIvQxLnLemZYK/oAL6OC9LGc1tHdfXG1NYNM++ASnYi87ECLuXQ0/DawSgqRZ9CQ+7KgtRPvm+1Y4Gglw5bjWmir+9K4i8HRn6YOz+fWblB7y8LrKYDVVkMSnDdRYN9KHq7I/iXPDU7EeUPt1WbTE9vcF3s7M25UMPWNbKrRGvtOz1cjRz/nNViYOlEEbV2F/LGHYgJeMkHmQYurR+g4soVtNhhIJFi3JtV9/m1f/oNP0H1JTSM+SyE1il5KJ9OFNvSu+hThMjG4REGP4pVoUZQvcF3RZXY8YyPsEi8T5hK09xYmdJVhA2T5+9T9CMLH444+xtQ919NghW31Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhlqcASNy3eMPF02NdURzocj0TYfge7ov9uhgp3WDrY=;
 b=MyVGXVXzd/AvVXLx+iHYcP3GU+R0mBZ456Y6rnoEdAVq0T6mSCen9qjW6U94A0Qun3QQb19XSLeVUbzWbvqUVJ5w7O6irQB/9VIzxbWRw8oVkFn3yK2DExiYWSrn0lug5TSH3jGrR9e5KGwpkRHajJyh4IkyK19V018BahLhIvJM1XQcFtb4JaDslSEJXRfM4WdlGLvci/e1opZ1kIczJSRt0mIdnL8UH/btzP4BCHmMIBQr4V5Yj4ggQzRz22HdXl7Gm+xojLJgtRHbBJoZ1/3Urcz9dD9+BYEQbtNpv58cOqeS7ZK6PcwJnHi65xjqtJ+Y8Bcsbm9oZ3WZCZI4ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhlqcASNy3eMPF02NdURzocj0TYfge7ov9uhgp3WDrY=;
 b=kqhIFtD90yuxjMFduSCqO7d6PNJY0LsdE1lEQtdBXYxVxq+JDPON8bp70ILLzWCucgl+1xpS3rLczQJm+tUAG9XkW4b8kRGSg7shVca3qu7N0KZXI0QmbUkqxW3LBQZ2UQnS+WGT6OilipPjZlM1LrjRYTPlXJgnDH73kRGGn3ceQa+1RvpMqnIv6SmyNb8nV2mVzigPLdxh5VuiR8z7k7EWRMQLRr/kNEuOL0ExQMGMKBFPcWjqY8Bj+bkxgc885CG6+p/i8IPJQFWSX4JHvl/bEP8IVpWb6Mo/ksEySPCvaMUKKZoLj5xJG3+lcs/eg27fIgZfuE5kmHjEVHSLXA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Julien Grall <julien.grall.oss@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 3/4] xen: arm: enable stack protector feature
Thread-Topic: [PATCH v2 3/4] xen: arm: enable stack protector feature
Thread-Index: AQHbQsSdZeSazgkTckCfCx9gDu8jUA==
Date: Fri, 6 Dec 2024 04:46:20 +0000
Message-ID: <87a5d94dwk.fsf@epam.com>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
	<20241130010954.36057-4-volodymyr_babchuk@epam.com>
	<d6f17723-8503-4e6e-bd5e-0a42a7149ac3@citrix.com>
	<CAJ=z9a2v-96CSjpRSfn2s+BydcC=boFt7RGhU+BRXpaVphG8MQ@mail.gmail.com>
	<79bb69b0-b00d-4e3c-966e-a341eac59499@citrix.com>
In-Reply-To: <79bb69b0-b00d-4e3c-966e-a341eac59499@citrix.com> (Andrew
	Cooper's message of "Thu, 5 Dec 2024 19:23:48 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB10089:EE_
x-ms-office365-filtering-correlation-id: c9a77fb4-d341-461a-e74f-08dd15b0edcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z2xPSTRIQ0JOSDRzMGlsc25xNHhvMXJnK3k3RVYrU0hZYVpsQmVRcXJaNFE2?=
 =?utf-8?B?TnJocGNTbWJtT1pZVUlGOFFyKzBJb1hKVHllWDVKTXBtWVdUZ2t2NWhrUmNT?=
 =?utf-8?B?M3hVS2NZbUVCVUFSbGxWMFREUC9peTQydjF1MitBWGY1M3o5Y1kwOUhvcEU1?=
 =?utf-8?B?dklZZDBJVVpTUndUUFQzd1ozN3A5d0ZNZk5wSjFtNDZURCtRTGwwVVo3RTVt?=
 =?utf-8?B?dHl6YTh1RXc4U2ZJWE51dUlaNGw3bWw1ODd1YmZPUE12Z3l5NURDcC9KWlFl?=
 =?utf-8?B?Z2tCZ3NlbUxBeHd4U2N1U1RDYzZmeTNDR2RBTlV4d3pseFNRMytFSXp5SU1J?=
 =?utf-8?B?WlVUSURKSXBqb1JFek5yMXp1NThJNWpmSXI2aFJBZ2t2Y1FHTS82SVhPemY0?=
 =?utf-8?B?UGRDR3NYK3V3d3FTd2RraVc0THlyaEkxQThqZ0xmbkFibjdaMlpON1B3TXFm?=
 =?utf-8?B?UWtPLzFuT3pocUpLbk9ZMXlrSmZSeU5EOVhXVmNiMzZuTXk4YVVjV2x2bmdT?=
 =?utf-8?B?NXlqenRYSDFFVmdUVzBFMmdWUXBvVWpXSkFLZVIyRkVRQVA2V2NLNFIyUmVE?=
 =?utf-8?B?YUZKNGZ3U1dDRFFqK0FsclpyWGQxRW40b3BKamlWZUtFVWkyRGRLeEN3VDh6?=
 =?utf-8?B?MVNnWEs3c204YzBqMW96aWwxT0ozS2J0UFZrZksrVjRJcnVaU3RmK1QyMmRr?=
 =?utf-8?B?QTBxL3FGYmhWS3h3ZnNuU3dTdGZ6dFUxMkxHaFVFcGFQeFBtV0hsSHdlK1A5?=
 =?utf-8?B?byt6bWV1cFZ5dGlvcUdwT2c2eCtEUlJub2M2ekNyU0xxbUg4KzFEV1lJWWdY?=
 =?utf-8?B?M3lpYUZFcE1idDQ0d1E4QWFsZjNRRWFFeDVob09tTFVZRTNVb2JNdnBMeGR2?=
 =?utf-8?B?OEJxVy8zbXEzT3N1bWhqZEpyV01EWkkyaXZIOGdpam1xVWpsL3EzT3dsRFFR?=
 =?utf-8?B?ZGxJOTJsaUFvZ2pDRCtzRmxwVnB3eThzSFlxU2dkWEc4VjVhcDlKWFVybno0?=
 =?utf-8?B?Z2JRcTlaQytOU2ZOR1lzUUMyVW8vdzJjVWpweVU2aTdPcjVVREtIRENiUWdC?=
 =?utf-8?B?bE1MWjBmazhUSWRRVUxhRjRISWhaVDlEUGUvQURoVGFkOVl3OEJzcm52OCtP?=
 =?utf-8?B?RGphLytlVEp1TmM1QWQxMlFvREFkcjlVS1JOWjM0UncxRDBPQ0VwWVMrR3Mx?=
 =?utf-8?B?VVpGVnFMMTNpQlEyc1lZOFV2OVB2SW9CZy83NDVRTE1KeUNVUC9Dc0FaTkV4?=
 =?utf-8?B?TnAvb0wzQ1ZsbnhzR053NkZVUExTUzRXSWV3RHBWUDVBSnpqNldGeS83ZlhR?=
 =?utf-8?B?ZXFUeHVydWRPNCt3Wk9qeWVJZTA1NnMxQXVnSFNSN3ZDV0xtU1dDNngxTzNK?=
 =?utf-8?B?QndoTUlPbmtVRWkxUENGbmJOR2wzYUZWZ1RiRHJlZ1RrUWp5Qk9wRmZPbHd1?=
 =?utf-8?B?bVcyYVorOU5RVEgwTGFzYjlXQmlnM1g0UHlUN0ZRTnVtRjJhVzNuYnRVYmk2?=
 =?utf-8?B?bStYSTVvaXFmMndaV0FxWndUdTJCL1h3aDFLNXlSTDQ2WlRIQ0hmalRMYTNB?=
 =?utf-8?B?dHNqR1RUSDRSb0ZHWUNmeS9yV2kvOHQrRGo2WEtEenM5K1p1amNjTHBzZW43?=
 =?utf-8?B?d1JVeS9ybFFNd1krT2dCaFR3MzIySEtCUGJuTkpMV2VpWFNXL3QvRzR1T1VQ?=
 =?utf-8?B?WTNhVGVJUXhKUWxxNnpZY2ZrdWU5UjBnQThwWDBleFFObWQ2bG1mTC9tWUtl?=
 =?utf-8?B?dzBkeFZveUxDMkY5eXhkSzJOWnROZUhBMUlFUFdtTlhYZWJiWjdhR2dTU0lV?=
 =?utf-8?B?b2ZqTlMwQzhOai9La29pUzJGcHYxWDY0cC9SSnBaR0Exdy83aVNOS2l3dHk5?=
 =?utf-8?B?UktFaXRhN0owb25LMzZkdkxURTdNeXd4UnVnUldiUnVLL1E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qzl5ampvMy9uVjd1RUNIa1lsZ1NPOSt4NkNEUjI3SVZjTExaODlVVk4yZnlW?=
 =?utf-8?B?b096TmtENDkweGpvcjExazNEQTdXc2pyWWZ2MDQ4NHNkYk9uY2FBRnFyNERB?=
 =?utf-8?B?ekVpNVlCd1JhS2VDd25ZbmtpQmM0a0p2SUdmbzRIVUx2bk1URG9rek9nckxF?=
 =?utf-8?B?MWtPM1M2SUdORUhEZlpNRlF3Q3I4Wkp2VXFGUjZRNW1EZHBkR1dQOTNhTUg5?=
 =?utf-8?B?Q3cybmxzMHlzZCtMZ1QvRmROb3pKMFI1ZFhvSythN1kweXhJOTFOU25HeC9W?=
 =?utf-8?B?cmNMLzBlRlR2VDZpU3ZPUEsxZ1FSMklOQ1pNWllZSzVUTmxJczBRR2xaVWsw?=
 =?utf-8?B?K2VzM0E1NmwrY2RHanc3REFPKyswNTVlV3Erajh2Y1hwWDIrdVJNeGV5blEy?=
 =?utf-8?B?cDF5dG5XSHFqYi85dmZ3L1hoczFCT1FaUENSZ1NqMnR3N2NBQmJ5NVJKK0hV?=
 =?utf-8?B?MThJUEh2cXl5K2ZYQ2ZwaVdpa0JrbzhueHVMcVJhcThuU20rTWQveDhPbXJZ?=
 =?utf-8?B?RGZMbXZsVDFnR2I4L3RtRi8zcTg4amhiSUpsQkpUbWRqTU9WdnRZd0owck9k?=
 =?utf-8?B?Qkw0NlpwUkJWdDZTbE5URlhXVElQTjBXYXpPQUhwaWpXc3lMZmZJV01ieGdR?=
 =?utf-8?B?S2ljdVJDT0Mrd0o0OUl3U3BBdC8zck9GcVlHYmN3SU13NHdjdkNqNlZzREFS?=
 =?utf-8?B?aEJZTUFFZ2laRjFxemIzNTd2ZTRHRldNZTNseU9VSFhsSnV2dUl5TTdwSk55?=
 =?utf-8?B?c3RpV2xCbVREUVpJZ21vMFY1Mi9JVGp2NFBkeDlIbFh3YlZsSENvY3o5MTl0?=
 =?utf-8?B?OXRqWEt2MzA4NE1Ud3ZQSEtDbDlwNjdDWkh3T2VKY2V2eTFmZXJZWmdLVTMx?=
 =?utf-8?B?ZzdObWdiWkwzd2VRb2tKQUFBOGowR3ZzaFJWWnM4Zk1CM1dBUjhYZ1Y2MmRN?=
 =?utf-8?B?YmZyTVZlckc5dFFkWG1HUGVZeVluMUxMU0VHNkIzYkNWN3VNdWdLdEEvMDRV?=
 =?utf-8?B?d1JhR2JsWTkrT29IT1IxckRMbGdicVVxYnpMWkJ5MXFYRlRmNXJ5ZlBsL2hE?=
 =?utf-8?B?Yncxd3kzOHUyK1N5cVNiNll1ZnNFVk5ndWh4VU9aeVVuanNQTmFkTmxvRXZU?=
 =?utf-8?B?TlRjb2FhbzBnQkZVNmhUOHhMRU0rbjNvU2g2VHk4TjcvU3JCQ3VaOEQxSnlz?=
 =?utf-8?B?a2VaYTU4cHAvR3BxTGM0L3BlNEZRL3FJU1Erc0dLNWJxTEhzQzNCVmxzakJD?=
 =?utf-8?B?bDFETktiOWhISTM4aVNnV3cwdnE5UGdzSDk2aFpuc051VEFJbVdVQXhlak5H?=
 =?utf-8?B?b0F6MjkwMHp4RFlnYWh5eHh2K3BsNG1JWmhSaWp0dnZTS3Y2ZUdrRjUvZ0tJ?=
 =?utf-8?B?RUhjaUp5WlZHSWFKa055YVhFeFZQajllTUVUY2JycjdiMSt0OUpOSU5DbGxy?=
 =?utf-8?B?NjdwWGNaU0VYdmgwbU41UkRwMTFtYWplUHZieWh4dlZzcWEzbTk4ZEFNb0cr?=
 =?utf-8?B?SjJFZ1JDZW9tQm11c1RKZnFrWmFEcTY2YWc0R2hxVVpqdzdMR25NbDIrNFJk?=
 =?utf-8?B?b2F4VVo3TGxZZ2FhM2dXWSsxUkQvKzduT0xSMG9BZVNMN2Y3Z0hnOHY3SHo2?=
 =?utf-8?B?ejRDVFJXKy8xQ0NGSkNsaEV2SSt0dGtGRFFWTmpGZzBXblFhWkZmMTllL3VW?=
 =?utf-8?B?N1BTMDNVcXVtWGI1L0FTQWNRN1Q4RHBSZGNDdVcxSzhQWGdwOVRiVExtclFL?=
 =?utf-8?B?R3RERnVnS3Y1QVJiUEEvUlVLaUg5RjNheGxZYVd5QmQ0ajdPbVJmS0RMK0tI?=
 =?utf-8?B?RnVWSXhZd3BFOUwwL2FUak51OTJhd3JkV1dSd0JuYU91WVZYRHp4RDlxSlc4?=
 =?utf-8?B?aER4RzIyV1NseUZOL3FBa29JYkpNQmlOMzBYVUxKdFRDTjYwV3R6QjY3UUk3?=
 =?utf-8?B?aHYyckp4UytTRkd5TDVQUE1IcFc1VysvRzl2ZlVvNXBVMk5GN0t3WFdRZGo4?=
 =?utf-8?B?RGZRRmxkYUhwL0kxcnFRMCtGQTlmanFFTG9lU1VZUWxHTGFrSll5NXVEM3hV?=
 =?utf-8?B?VXQxQmtvUzZBUTM4TVRMMkNLbEo5MyszcTZTQVJ1SW84WTRxL2hsc3kwTjZ0?=
 =?utf-8?B?SXFFTXhWZStPdG9XSGYvMlNObk9rS0xZWlhuYjdBTzJySUYydXh2REVKdXRa?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80493A35FDC2F744981B36DD3CF658CA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a77fb4-d341-461a-e74f-08dd15b0edcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 04:46:20.4090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/1sAHp3EoUrbgNVkN7h5k4X+ZJWQODzihVuqKGN46hYk6o2a+UR/4OVk/QJBgHe1JsodmTZwfNLoN/5xpvrV1k/P5aWvVC4NDa0ZwGFylQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10089

DQpIaSBBbmRyZXcsDQoNCkFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
IHdyaXRlczoNCg0KPiBPbiAwMy8xMi8yMDI0IDExOjE2IHBtLCBKdWxpZW4gR3JhbGwgd3JvdGU6
DQo+PiBPbiBUdWUsIDMgRGVjIDIwMjQgYXQgMjI6MDAsIEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+IE9uIDMwLzExLzIwMjQgMToxMCBhbSwgVm9s
b2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0
dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+Pj4+IGluZGV4IDJlMjdhZjQ1NjAuLmY4NTVl
OTdlMjUgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+Pj4+ICsrKyBi
L3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+Pj4+IEBAIC0zNDEsNiArMzQyLDggQEAgdm9pZCBhc21s
aW5rYWdlIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBmZHRfcGFkZHIpDQo+Pj4+ICAg
ICAgICovDQo+Pj4+ICAgICAgc3lzdGVtX3N0YXRlID0gU1lTX1NUQVRFX2Jvb3Q7DQo+Pj4+DQo+
Pj4+ICsgICAgYm9vdF9zdGFja19jaGtfZ3VhcmRfc2V0dXAoKTsNCj4+Pj4gKw0KPj4+PiAgICAg
IGlmICggYWNwaV9kaXNhYmxlZCApDQo+Pj4+ICAgICAgew0KPj4+PiAgICAgICAgICBwcmludGso
IkJvb3RpbmcgdXNpbmcgRGV2aWNlIFRyZWVcbiIpOw0KPj4+IEkgc3RpbGwgdGhpbmsgdGhhdCBf
X3N0YWNrX2Noa19ndWFyZCB3YW50cyBzZXR0aW5nIHVwIGluIEFTTSBiZWZvcmUNCj4+PiBlbnRl
cmluZyBDLg0KPj4+DQo+Pj4gVGhlIG9ubHkgcmVhc29uIHRoaXMgY2FsbCBpcyBzbyBsYXRlIGlz
IGJlY2F1c2UgWGVuJ3MgZ2V0X3JhbmRvbSgpDQo+Pj4gc2VxdWVuY2UgaXMgbGVzcyB0aGFuIGhl
bHBmdWwuICBUaGF0IHdhbnRzIHJld3JpdGluZyBzb21ld2hhdCwgYnV0IG1heWJlDQo+Pj4gbm93
IGlzbid0IHRoZSBiZXN0IHRpbWUuDQo+Pj4NCj4+PiBFdmVuIGlmIHlvdSBpbml0aWFsaXNlIF9f
c3RhY2tfY2hrX2d1YXJkIGl0IHRvIC0xIHJhdGhlciB0aGFuIDAsIGl0J3MNCj4+PiBzdGlsbCBn
b3QgYSBiZXR0ZXIgY2hhbmNlIG9mIGNhdGNoaW5nIGVycm9ycyBkdXJpbmcgdmVyeSBlYXJseSBi
b290OyB0aGUNCj4+PiBpbnN0cnVtZW50YXRpb24gaXMgcHJlc2VudCwgYnV0IGlzIHVzaW5nIDAg
YXMgdGhlIGNhbmFyeSB2YWx1ZS4NCj4+Pg0KPj4+IE9uIHg4NiwgZHVtcGluZyB0aGUgY3VycmVu
dCBUU0MgdmFsdWUgaW50byBfX3N0YWNrX2Noa19ndWFyZCB3b3VsZCBiZQ0KPj4+IGZhciBiZXR0
ZXIgdGhhbiB1c2luZyAtMS4gIEV2ZW4gaWYgaXQgc2tld2VkIHRvIGEgbG93ZXIgbnVtYmVyLCBp
dCdzDQo+Pj4gdW5wcmVkaWN0YWJsZSBhbmQgbm90IGdvaW5nIHRvIHJlb2NjdXIgYnkgYWNjaWRl
bnQgZHVyaW5nIGEgc3RhY2sgb3ZlcnJ1bi4NCj4+Pg0KPj4+IFN1cmVseSBBUk0gaGFzIHNvbWV0
aGluZyBzaW1pbGFyIGl0IGNvdWxkIHVzZT8NCj4+IFRoZXJlIGlzIGEgb3B0aW9uYWwgc3lzdGVt
IHJlZ2lzdGVyIHRvIHJlYWQgYSByYW5kb20gbnVtYmVyLg0KPg0KPiBPbmx5IGluIHY4LjUgYXMg
ZmFyIGFzIEkgY2FuIHNlZSwgYW5kIGV2ZW4gdGhlbiBpdCdzIG5vdCByZXF1aXJlZC7CoA0KPiBB
bHNvLCBpdCBzdWZmZXJzIGZyb20gdGhlIHNhbWUgcHJvYmxlbSBhcyBSRFJBTkQgb24geDg2OyB3
ZSBuZWVkIHRvIGJvb3QNCj4gdG8gYXQgbGVhc3QgZmVhdHVyZSBkZXRlY3Rpb24gYmVmb3JlIHdl
IGNhbiBzYWZlbHkgdXNlIGl0IGlmIGl0J3MgYXZhaWxhYmxlLg0KPg0KPj4NCj4+PiBbZWRpdF0g
WWVzLCBnZXRfY3ljbGVzKCksIHdoaWNoIGV2ZXJ5IGFyY2hpdGVjdHVyZSBzZWVtcyB0byBoYXZl
LiAgSW4NCj4+PiBmYWN0LCBzd2FwcGluZyBnZXRfcmFuZG9tKCkgZnJvbSBOT1coKSB0byBnZXRf
Y3ljbGVzKCkgd291bGQgYmUgZ29vZA0KPj4+IGVub3VnaCB0byBnZXQgaXQgdXNhYmxlIGZyb20g
ZWFybHkgYXNzZW1ibHkuDQo+PiBOb3QgcXVpdGUuIFRlY2huaWNhbGx5IHdlIGNhbid0IHJlbHkg
b24gdGhlIHRpbWVyIGNvdW50ZXIgdW50aWwNCj4+IHBsYXRmb3JtX2luaXRfdGltZSgpIGlzIGNh
bGxlZC4NCj4+IFRoaXMgd2FzIHRvIGNhdGVyIGFuIGlzc3VlIG9uIHRoZSBleHlub3Mgd2UgdXNl
ZCBpbiBPc3NUZXN0LiBCdXQNCj4+IGFyZ3VhYmx5IHRoaXMgaXMgdGhlIGV4Y2VwdGlvbg0KPj4g
cmF0aGVyIHRoYW4gdGhlIG5vcm0gYmVjYXVzZSB0aGUgZmlybXdhcmUgb3VnaHQgdG8gcHJvcGVy
bHkgaW5pdGlhbGl6ZQ0KPj4gdGhlIHRpbWVyLi4uDQo+Pg0KPj4gSSBoYXZlbid0IGNoZWNrZWQg
cmVjZW50IGZpcm13YXJlLiBCdXQgSSBjb3VsZCBiZSBjb252aW5jZWQgdG8gYWNjZXNzDQo+PiB0
aGUgY291bnRlciBiZWZvcmUNCj4+IGhhbmQgaWYgd2UgcmVhbGx5IHRoaW5rIHRoYXQgc2V0dGlu
ZyBfX3N0YWNrX2Noa19ndWFyZCBmcm9tIEFTTSBpcyBtdWNoIGJldHRlci4NCj4NCj4gVGhlIEMg
aW5zdHJ1bWVudGF0aW9uIGlzIGFsd2F5cyBwcmVzZW50LCByaWdodCBmcm9tIHRoZSB2ZXJ5IHN0
YXJ0IG9mDQo+IHN0YXJ0X3hlbigpLg0KPg0KPiBFdmVuIHdvcmtpbmcgd2l0aCBhIGNhbmFyeSBv
ZiAwLCB0aGVyZSdzIHNvbWUgdmFsdWUuwqAgSXQgd2lsbCBzcG90DQo+IGNsb2JiZXJpbmcgd2l0
aCBhIG5vbi16ZXJvIHZhbHVlLCBidXQgaXQgd29uJ3Qgc3BvdCBlLmcuIGFuIG92ZXJseS1sb25n
DQo+IG1lbXNldCgsIDApLg0KPg0KPiBEdXJpbmcgYm9vdCwgd2UncmUgbm90IGRlZmVuZGluZyBh
Z2FpbnN0IGEgbWFsaWNpb3VzIGVudGl0eS7CoCBTaW1wbHkNCj4gZGVmZW5kaW5nIGFnYWluc3Qg
YmFkIGRldmVsb3BlciBleHBlY3RhdGlvbnMuDQo+DQo+IFRoZXJlZm9yZSwgYW55dGhpbmcgdG8g
Z2V0IGEgbm9uLXplcm8gdmFsdWUgcHJpb3IgdG8gZW50ZXJpbmcgQyB3aWxsIGJlDQo+IGFuIGlt
cHJvdmVtZW50LsKgIEJlc3QtZWZmb3J0IGlzIGZpbmUsIGFuZCBpZiB0aGVyZSdzIG9uZSBwbGF0
Zm9ybSB3aXRoDQo+IGFuIGVycmF0YSB0aGF0IGNhdXNlcyBpdCB0byBtaXNzIG91dCwgdGhlbiBv
aCB3ZWxsLsKgIEFueSBvdGhlciBwbGF0Zm9ybQ0KPiB3aGljaCBtYW5pZmVzdHMgYSBjcmFzaCB3
aWxsIHN0aWxsIGxlYWQgdG8gdGhlIHByb2JsZW0gYmVpbmcgZml4ZWQuDQo+DQo+IEkgc3VwcG9z
ZSB0YWtpbmcgdGhpcyBhcmd1bWVudCB0byBpdCdzIGxvZ2ljYWwgY29uY2x1c2lvbiwgd2UgY291
bGQNCj4gaW5pdGlhbGlzZSBfX3N0YWNrX2Noa19ndWFyZCB3aXRoIGEgcG9pc29uIHBhdHRlcm4s
IGFsdGhvdWdoIG5vdCBvbmUNCj4gc2hhcmVkIGJ5IGFueSBvdGhlciBwb2lzb24gcGF0dGVybiBp
biBYZW4uwqAgVGhhdCBhbG9uZSB3b3VsZCBiZSBiZXR0ZXINCj4gdGhhbiB1c2luZyAwIGluIGVh
cmx5IGJvb3QuDQoNCk9rYXksIHNvIEkgY29tZSB3aXRoIHRocmVlLXN0YWdlIGluaXRpYWxpemF0
aW9uOg0KDQoxLiBTdGF0aWMgcG9pc29uIHBhdHRlcm4NCjIuIFRpbWUtYmFzZWQgZWFybHkgdmFs
dWUNCjMuIFJhbmRvbS1udW1iZXIgYmFzZWQgbG9uZy10ZXJtIHZhbHVlDQoNClNvLCBhcGFydCBm
cm9tIGFscmVhZHkgcHJlc2VudA0KDQpzdGF0aWMgYWx3YXlzX2lubGluZSB2b2lkIGJvb3Rfc3Rh
Y2tfY2hrX2d1YXJkX3NldHVwKHZvaWQpOw0KDQpJIGRpZCB0aGlzOg0KDQovKg0KICogSW5pdGlh
bCB2YWx1ZSBpcyBjaG9zZW4gYnkgZmFpciBkaWNlIHJvbGwuDQogKiBJdCB3aWxsIGJlIHVwZGF0
ZWQgZHVyaW5nIGJvb3QgcHJvY2Vzcy4NCiAqLw0KI2lmIEJJVFNfUEVSX0xPTkcgPT0gMzINCnVu
c2lnbmVkIGxvbmcgX19yb19hZnRlcl9pbml0IF9fc3RhY2tfY2hrX2d1YXJkID0gMHhkZDJjYzky
NzsNCiNlbHNlDQp1bnNpZ25lZCBsb25nIF9fcm9fYWZ0ZXJfaW5pdCBfX3N0YWNrX2Noa19ndWFy
ZCA9IDB4MmQ4NTM2MDVhNGQ5YTA5YzsNCiNlbmRpZg0KDQovKiBUaGlzIGZ1bmN0aW9uIHNob3Vs
ZCBiZSBjYWxsZWQgZnJvbSBBU00gb25seSAqLw0Kdm9pZCBfX2luaXQgYXNtbGlua2FnZSBib290
X3N0YWNrX2Noa19ndWFyZF9zZXR1cF9lYXJseSh2b2lkKQ0Kew0KICAgIC8qDQogICAgICogTGlu
ZWFyIGNvbmdydWVudCBnZW5lcmF0b3IuIENvbnN0YW50IGlzIHRha2VuIGZyb20NCiAgICAgKiBU
YWJsZXMgT2YgTGluZWFyIENvbmdydWVudGlhbCBHZW5lcmF0b3JzDQogICAgICogT2YgRGlmZmVy
ZW50IFNpemVzIEFuZCBHb29kIExhdHRpY2UgU3RydWN0dXJlIGJ5IFBpZXJyZSBM4oCZRWN1eWVy
DQogICAgICovDQojaWYgQklUU19QRVJfTE9ORyA9PSAzMg0KICAgIGNvbnN0IHVuc2lnbmVkIGxv
bmcgYSA9IDI4OTEzMzY0NTM7DQojZWxzZQ0KICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgYSA9IDI4
NjI5MzM1NTU3Nzc5NDE3NTc7DQojZW5kaWYNCiAgICBjb25zdCB1bnNpZ25lZCBjID0gMTsNCiAg
ICB1bnNpZ25lZCBsb25nIGN5Y2xlcyA9IGdldF9jeWNsZXMoKTsNCg0KICAgIGlmICggIWN5Y2xl
cyApDQogICAgICAgIHJldHVybjsNCg0KICAgIF9fc3RhY2tfY2hrX2d1YXJkID0gY3ljbGVzICog
YSArIGM7DQp9DQoNCmJvb3Rfc3RhY2tfY2hrX2d1YXJkX3NldHVwX2Vhcmx5KCkgaXMgYmVpbmcg
Y2FsbGVkIGJ5IEFTTSBjb2RlIGR1cmluZw0KZWFybHkgYm9vdCBzdGFnZXMuDQoNClRoZW4sIGxh
dGVyLCBib290X3N0YWNrX2Noa19ndWFyZF9zZXR1cCgpIGlzIGNhbGxlZC4NCg0KSWYgeW91IGFy
ZSBva2F5IHdpdGggdGhpcyBhcHByb2FjaCwgSSdsbCBzZW5kIHRoZSBuZXh0IHZlcnNpb24uDQoN
Ci0tIA0KV0JSLCBWb2xvZHlteXI=

