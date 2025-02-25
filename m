Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF59A43CB8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895613.1304270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmskT-0002sM-59; Tue, 25 Feb 2025 11:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895613.1304270; Tue, 25 Feb 2025 11:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmskT-0002pv-1v; Tue, 25 Feb 2025 11:05:13 +0000
Received: by outflank-mailman (input) for mailman id 895613;
 Tue, 25 Feb 2025 11:05:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kI97=VQ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tmskS-0002pl-4E
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:05:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20622.outbound.protection.outlook.com
 [2a01:111:f403:2614::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60b0b8c8-f368-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 12:05:10 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAVPR03MB8996.eurprd03.prod.outlook.com
 (2603:10a6:102:2fd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 11:05:05 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 11:05:05 +0000
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
X-Inumbo-ID: 60b0b8c8-f368-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVggu+FZFDgen9tKKednl+CxyySiAmg3TIFtQdKxEpyjap/IhcbGgEJlK59rsygw48CbErixSP384ekkuSIj1bENBThn7Tpw1ur+IeQZZEjGsbnVt0ZglQSJhIZwc9JVyXJMZF8ko3MTgC/3MNWyk9xYVGAY4roRrPMEc0+7ITrQnQ56ac4NsHJebRRWOZLRCf3OsGJm2WSGabcgWlDX2jZSesvb5u5jtFcM1jwdi1bpbp5btSFbXYBoMhlnABIMtCygYUNuLO8YeWtz95jJ6l+DnUs4D/Th2KCn6B6Zw6cOTAQq+D1kVWeIN6YGaAAS63x4fPaKymJ2sJ5JiIOU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW9/0YV8TRIoxWdYkRtehy7mxpB7dXS9OU41lrZ5WYc=;
 b=GzzZI4jVZ1soOeow1tMWkcuKLr2SkSAqmyWzSeph/yyOjRfBhY6SUeG9iYd3+avKW3nLYS+3Un6f2SzoBadFf6n7Bq8ckYIAp+uHOcTd95Bh3wKGjXWo9Sxvrs54XW32CdMsXrnvoDPQm3058ppP5s0f9OQYEZQx3IJklq8VWARjtLuGZtpBHS9ksWTV66PlHF7U6QVHDVAAO3Sk5CUfMGgy7PUcqANZYaONS1oleHSAky82usdmbx687NKEPMlwaosrQeD37Eh8FktWAjIHlT7XCNjdVUzHSpsLdzWySLl/qnbnDwnY71zC37p9w9FNG6/k9Xmq2BsOpXSQVCYzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qW9/0YV8TRIoxWdYkRtehy7mxpB7dXS9OU41lrZ5WYc=;
 b=CMsnuhM1b1P1BP6SX2b1byyBTcvknd9Qh67/dy2jjvxpXqkdMy5NwOrVKc7BWZw7QLK0ra4h1LCPj+xpxcF973CkdGZtEfEuYWdUZcvdeJyAHj+ZHx9kUXEA0haSPuIsmZL56yWGZD0BL9dN56Y7n3lZ5UPZfImwh9Kb6CSYTdmkapkqKRK5pc6cmyADZBmz1oFuojkSK53tYhMd8M0czChd3yM/UkIfB/X9btrgcuo3X0O6PLXzLz8VcmAR6bu6rEm1l9u5/+UZB3UA5lAAkfKuOXHBrxuympiUiQmJbRLLm3Q4OszS/zgER8+XKt7RM3ldFYHowxSqSbk6C9fluQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 1/8] iommu/arm: Add iommu_dt_xlate()
Thread-Topic: [PATCH v8 1/8] iommu/arm: Add iommu_dt_xlate()
Thread-Index: AQHbe6bWEAW8Q/sQaUm9DrJ2a4q+MLNAWtKAgBeYHYA=
Date: Tue, 25 Feb 2025 11:05:04 +0000
Message-ID: <bab5a083-3aa2-4c5f-b798-57322e1af521@epam.com>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <02afc1bce09dd22865c7e2bad6cad9a804fca64b.1739182214.git.mykyta_poturai@epam.com>
 <f8f72da9-797e-44e5-93c2-cadb9fd1aae4@suse.com>
In-Reply-To: <f8f72da9-797e-44e5-93c2-cadb9fd1aae4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAVPR03MB8996:EE_
x-ms-office365-filtering-correlation-id: 5f5cc69e-8f57-4acc-8df8-08dd558c422f
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K0t4dVp2WVBNSW1PLzJsbWVCc3FaYnFYWHNKOWNmS21sNGdLNmZIOFpUbEo4?=
 =?utf-8?B?Y3QvZVVJVzhJNHhxMlpaekdaYks5dlFWdk9uTFBMVWdpQ1V1RTUvN0FhSDNM?=
 =?utf-8?B?MEl3ZHl6anpvOUFnb0lkQ2hMUTRzcDFJeXYxUzVDUURrWG1XejJzTjJLTFBG?=
 =?utf-8?B?eE0vRUNaVVU5NTVRTHBXNHk3dTJ5WWhPZHFibVdTbFF0S0o1VGZXeUQxMnNh?=
 =?utf-8?B?Z1A4Rm9WTCt5bUpZZmRybjVUaWV3KzF3bU9RZWhKSEZyQnpLL1VnUkhUek5i?=
 =?utf-8?B?U0x4NHNIUllSR2VncjhySW1QejVCQ3ljRzhnVWpJREJiRFd3b2NiWFNvWFk2?=
 =?utf-8?B?cUVQREZEZ0Zvb3JHWi9hUTk1WndFWG5QYmtmeEZySHc5LzlCUkhHcDhLWER6?=
 =?utf-8?B?WUhnQzl2NEUwNVZ6eU5jM2lhNW1IZU1oODR0cjRiY0NtbjVwUUVjckU1dnV2?=
 =?utf-8?B?NDBjRk5Qek9BdXBnWkFzcEhYVVM4b0xtQmgvMW95UjRKM2dCdXM1VHYxWjJq?=
 =?utf-8?B?TXV6eGoxNTdQV3psSlhnalREQnhxZmJRY1dHbEZrYXJ1YUY5ODZXTDlHTVVW?=
 =?utf-8?B?aUZaQ2NCNGNudzJ4RUlubzBKWmEvZTlhaWNGMnpUN1Z0NHdtdGR3NUVOK2g3?=
 =?utf-8?B?M2swaUtVZjlZSjMrdE0yY0VqTDc5KzFtYmt2QTdDcUR2aGpHUFVkMU0veUg0?=
 =?utf-8?B?TVErQVBROUFmaVZCRVM3STdXMjEzL3k2emNldDFuRW1ueEw5QnJiTDlBT1Bj?=
 =?utf-8?B?SlVWSFgwTy9mbGc3ajlLS3dXSGRvaGlWWngxd3RtREdWbGQzNjJKRTNVa2RH?=
 =?utf-8?B?WG5YNHNmWThvbm5sbmh0dGx4akxUcDV1WHpLUzM4UnM3cjFKS243SVVTSzho?=
 =?utf-8?B?WjBlUmQ5SU00azN3bThqeGEwZEhqaGJJTGdNaXBUYkxkYWhoV0ZzQWhzc1hz?=
 =?utf-8?B?amc3TmpKOUljdUhDOTdoV09TOUtYRTFXYkowOWVUb0NBbXlwUHg2TmNRZktx?=
 =?utf-8?B?dC9UUFVScXNBNnlzKzg2UlE5QlE3RVZOend2MFBwclNybkJVM0p1ZWI5QmEv?=
 =?utf-8?B?WS95cVFRNkJ2VEZIRnBLVjl0U21UdlBDUjNkeWk4RTZZZUMycEl2TlZzZ0cr?=
 =?utf-8?B?UFdzeHNUc3dzdDRCNnNRRGJxOG9MeHJyMmNtMkdhZExRYmJjcHRCcjRCdzlO?=
 =?utf-8?B?N2NHU0dGVEsycnlkVjZYTllpNTlpUXNQTkFwODhBMC9tZ2U4djJNcE0rNkx6?=
 =?utf-8?B?dVd4OXRFbDhGMDlSRUVmY2dvQTlrWTlXT3Q2bnY4ZHZwSVZqWElSSTV0aTlR?=
 =?utf-8?B?V00rYzN4T2hkN2FjaFFzdStOaEsyWUZIRXBBZlg0OGpSaWJiNmI1cm9VR0xy?=
 =?utf-8?B?QVYySEhxK3JSM2tmSVJwKytlcG43WTBSdG00bnRWWUdMeHViekIzbGNXa2hh?=
 =?utf-8?B?amhZc2Zsa0R2YUpHcjA2SXRHanV1RktITEc2M2hsclpxSXlpWks3TFlFcXph?=
 =?utf-8?B?bXlFdC9STTFVeFAzbHVCaHpkWm04TXhIOGhKZmJpT1hObllpb3FGRC9hUVMx?=
 =?utf-8?B?S3k1S1piQWs2RE1OMkVyWXEzSTU3eGlHbmZDWDBsWWtRT09UQ29DT3BzNFN4?=
 =?utf-8?B?ZlhJSEJjbXdpTllLRW1Tckg0OHcybUVNSEhwUjBSSUF4UjZUNUpVMXRub3Jt?=
 =?utf-8?B?NUNjeTFPb2Vpb0huOW9JdkJXcjlsdTl1THZVRjhzN2FzT1NwYXlkOWVEV1VS?=
 =?utf-8?B?Uk51ZWNFTkcySjNJcFhEOWxlcUtkT2NxRUI2QzRsYm4wTXNDcU82Z0RZRU9N?=
 =?utf-8?B?SlZxdnJOTUM5dE9kdmhKL3hmemdvNE1HMVE2azVSeGdsNTBqQ2xxeEdRMlFs?=
 =?utf-8?B?ZHBYeGw4MGpBSGRBVlJydDh4WlgybTdTc0hhK1R4R05CUVBEWkRBeVpSc1cx?=
 =?utf-8?Q?kWxkw3ZpnREnkJlRdmXbR/plykVqc/n1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nmd0RlBKUDgyVEdzZDhxYm5GQ2c4S2poQTArUWFQSWhZbWZNNSs0VTdzbm9t?=
 =?utf-8?B?VElwQWFCTElia0NPYkxwbXJMdzNKdnNyTGszSXI3R0xhTHl2OFVMS0ZGYS9J?=
 =?utf-8?B?UURUQStNQzhWR2RwQzBvVmtkZ1ZqTWJoZzFIcmV3c0VwajhYaWhpWlExQmha?=
 =?utf-8?B?NmNqZUgzRjZackNyb0ZvYm0wSFRKd0lVRUFrSW03cWlXZDc2b3RrWkk1WHRK?=
 =?utf-8?B?cjZ0aTg0L3Q3bDRtVXlRcEh4VzV4ajJWVHBZd0dZU2RUOThYSjZCL3kxMDVq?=
 =?utf-8?B?b2JNdU96R3AwNndTZ3lrSW1DUzdLVGljTDJmQUxUbkNYdjV2S1hXYUp5Qytz?=
 =?utf-8?B?WVdEYTl3UEttd3J3WkJlK0RhWHVKK1h2UDFtQmlYM2J2QkdaUUR4WXkyQndj?=
 =?utf-8?B?dzJheHF0ckNJcXNZUFNUT2wrSFJ2aWZVSnFDbFl3bCtEeVpPOU5oZmNyTjly?=
 =?utf-8?B?RlZOM291T0k3b2tXK1NOek9nVk1PUVUxc0lObXFaQk81dnNXZFFRM0ZNUllx?=
 =?utf-8?B?V3N6UkFNV2ZDZVNlNmxrUW9UYzVYZUxUT0RpaWo0R2Jka0dCSFpWU3hYbjBn?=
 =?utf-8?B?MEYrRXpraStzenB2bWxDRzVkYkZVWFIvZ0tYb3JpUEIwK3J6OU5VQTd0OThU?=
 =?utf-8?B?eFlRcGwwdFNrSi9adTZINFplK2dGZG5uL3pDUmFWS3EvN2gzUEFPdnhhb2d1?=
 =?utf-8?B?M3V4bXA5aE1ySmpnWTA5cXZmS2prYUI3a1B1L0x5TUZVUHg5OHNXblMvV0hO?=
 =?utf-8?B?ODJVbDZRYUZsRlFSNUJuWDFFRXlaT3RRT1JmUUR2V3Z5QmwrWGNLbkZvMEp3?=
 =?utf-8?B?WlM3K0NVRm1PSkIrZ1g5a2F1U2pRUEk5MjFQaExGNHJFcU90OGpsL2RzSHU1?=
 =?utf-8?B?REdRN3U0bzZIRmt4SlpHK2YrZG9oWC90R2tNMkREd0lUTGZocTdrTkk5R2dL?=
 =?utf-8?B?L0ZzRjk1TVlybmE4TXNFemh3S05mKzFXekJ2TUZ2QTgzQnJ3UnlMZGpEd0tZ?=
 =?utf-8?B?S3ZhQUZpbU9LeHdZMDFJMS9Ea205b1lJYzNKZVdWMUlibVh4cEo2Nko4UVJX?=
 =?utf-8?B?RDFvYkY4RDRVSzFjRWtSSGF4c05odldoeG5iYmJIRTcxdkovbG9ncEJ3d0hn?=
 =?utf-8?B?aGEraXRLcGt4Y1JnaDA1VG5LYVUyNkwzLzkvekhFUHhQVDZWY3c2SG9MSU52?=
 =?utf-8?B?L3FaYXlVVUlmczgwa2ZBVlBhT0pEa201cXdMR1F3R0RseGtyZjhxeUFTdmFk?=
 =?utf-8?B?d0J6TlhKODk4V0pLVHZvNnRaSHIzcUZobkNlWkxOMGVnRk5MY0V4Y056ZEJK?=
 =?utf-8?B?RTEyT3ZTRmZHZi9Ba0Ivc2ZHdzZoNVh4VHRMcG92U2ttWkU0cWhaaDhPT1M2?=
 =?utf-8?B?eDJFeGJ2OGNSRHl1L2xubzZNZ0Q4c0h6SUNvY1pKaTJGZHhyaTZ4NnpoSHRH?=
 =?utf-8?B?RDQ2S2g0eTkyTDNjempnUWlxdDlhajhNZGtvUzJtUyt6dG1BaWtXb2J1Zmp2?=
 =?utf-8?B?akZjUWE2S2hWTGx5SERROWc3WWY0YkNqdnR1MlduZ2lxY0dldWl4SjR0Q04x?=
 =?utf-8?B?cGNJUzlNTUMraGY0dEtoM09MZU9rQXZZMHQwWm5sMm11b1NGZDBnTGFpd1li?=
 =?utf-8?B?TVM1dTFNamt2OTg3bDJCdldpaFVIRjFtTDRIbjBtM0NvbXRZVitad25LVlZD?=
 =?utf-8?B?VXo4TUFralArd3ZGYjhhVkRHWFpSenYzRHdObk5mNEd6T1UzRVZWZDBtSCtG?=
 =?utf-8?B?VDJ3ZGIvZjF2akVWdXRnYkFrbElRTHg4bzVRVGdLTzNiVzZmOGVLS2JzbXhj?=
 =?utf-8?B?M2ZUbElFUWxqa0FLWGFleE5GV25Kcmh4ZkRkUEVQWkZVSDZoeXZOYi9RVURt?=
 =?utf-8?B?WjlkaFdxZG1jVHhBRlZoTkpSa1AxUUdBYnZ3dUtrQ1lEaEFETnpSQTZEWHNO?=
 =?utf-8?B?UXdIVktoSU1XSXhWTTVGYWtHdS9tM0JEMjQ4YWFSUlkxV1I2RDQ1NUk0MEZP?=
 =?utf-8?B?TFppYWFWZEdKZ29PWlJDNmNFVzQyUUJ1cHhhb3hpWkIvZ2NMNmx6VlUyVTJk?=
 =?utf-8?B?TStGdVdVWG9lRUVndUcwbnlBdDFkejZwamdnNWhTanE3dzdBM3Z6NTE5aEwz?=
 =?utf-8?B?dzdRbFR4L2lZR0xXZkh2eFVtSVlMRHVDQWhGZUpjRDRPQVdmby9YeFJzdS82?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DE87835D3C6424A99EAD0CBC700821A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5cc69e-8f57-4acc-8df8-08dd558c422f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 11:05:05.0387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i28aH0nyqXM7HILmlJNMQRS2Rasb/WTFahJAWjA59OHt99QGYlyx1wfZi0Ib0zvlmB4sYCXt3rVlGB0YicyR/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8996

T24gMTAuMDIuMjUgMTI6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMC4wMi4yMDI1IDEx
OjMwLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21t
dS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaA0KPj4gQEAgLTIzOCw2ICsyMzgs
MTQgQEAgaW50IGlvbW11X2RvX2R0X2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBz
dHJ1Y3QgZG9tYWluICpkLA0KPj4gICAgKi8NCj4+ICAgaW50IGlvbW11X3JlbW92ZV9kdF9kZXZp
Y2Uoc3RydWN0IGR0X2RldmljZV9ub2RlICpucCk7DQo+PiAgIA0KPj4gKy8qDQo+PiArICogU3Rh
dHVzIGNvZGUgaW5kaWNhdGluZyB0aGF0IERUIGRldmljZSBjYW5ub3QgYmUgYWRkZWQgdG8gdGhl
IElPTU1VDQo+PiArICogb3IgcmVtb3ZlZCBmcm9tIGl0IGJlY2F1c2UgdGhlIElPTU1VIGlzIGRp
c2FibGVkIG9yIHRoZSBkZXZpY2UgaXMgbm90DQo+PiArICogY29ubmVjdGVkIHRvIGl0Lg0KPj4g
KyAqLw0KPj4gKw0KPj4gKyNkZWZpbmUgRFRfTk9fSU9NTVUgICAgMQ0KPiANCj4gV2hpbGUgYW4g
aW1wcm92ZW1lbnQsIGl0IHN0aWxsIGlzbid0IGNsZWFyIHdob3NlICJzdGF0dXMgY29kZSIgdGhp
cyBpcy4NCj4gVGhlICNkZWZpbmUgaXMgZWZmZWN0aXZlbHkgaGFuZ2luZyBpbiB0aGUgYWlyLCBm
cm9tIGFsbCBJIGNhbiB0ZWxsLiBBbmQNCj4gZnJvbSBpdCBub3QgYmVpbmcgYSBub3JtYWwgZXJy
b3IgY29kZSBpdCBpcyBwcmV0dHkgY2xlYXIgdGhhdCBpdCBiZXR0ZXINCj4gd291bGQgaGF2ZSBv
bmx5IHZlcnkgbmFycm93IHVzZS4NCj4gDQo+IEFsc28gY2FuIHlvdSBwbGVhc2Ugb21pdCBhbiBp
bnRlcnNwZXJzaW5nIGJsYW5rIGxpbmUgd2hlbiB0aGUgY29tbWVudA0KPiBpcyBzcGVjaWZpY2Fs
bHkgdGllZCB0byBhIGRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24/DQo+IA0KPiBKYW4NCg0KSGkg
SmFuDQoNCldoYXQgd291bGQgeW91IHNheSBhYm91dCByZW1vdmluZyB0aGlzIHN0YXR1cyBjb2Rl
IGVudGlyZWx5IGFuZCANCnJldHVybmluZyBzb21ldGhpbmcgbGlrZSAtRU5PREVWIGluc3RlYWQs
IHdpdGggYWRkaW5nIHNwZWNpYWwgaGFuZGxpbmcgDQpmb3IgdGhpcyByZXR1cm4gdG8gdGhlIGNh
bGxlcnMgd2hlcmUgbmVlZGVkPw0KDQotLSANCk15a3l0YQ==

