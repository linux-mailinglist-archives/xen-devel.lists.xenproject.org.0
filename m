Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B79B0559D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043875.1413922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbTj-00085D-BM; Tue, 15 Jul 2025 08:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043875.1413922; Tue, 15 Jul 2025 08:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbTj-000838-8c; Tue, 15 Jul 2025 08:57:35 +0000
Received: by outflank-mailman (input) for mailman id 1043875;
 Tue, 15 Jul 2025 08:57:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Fzp=Z4=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1ubbTh-000832-Fn
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:57:33 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc1cb657-6159-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 10:57:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56F8vQG2011285; Tue, 15 Jul 2025 04:57:27 -0400
Received: from XCH16-08-08.nos.boeing.com (xch16-08-08.nos.boeing.com
 [144.115.66.116])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56F8vIrs011242
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 15 Jul 2025 04:57:18 -0400
Received: from XCH16-04-10.nos.boeing.com (144.115.66.88) by
 XCH16-08-08.nos.boeing.com (144.115.66.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Tue, 15 Jul 2025 01:57:17 -0700
Received: from XCH19-EDGE-C02.nos.boeing.com (130.76.144.198) by
 XCH16-04-10.nos.boeing.com (144.115.66.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57 via Frontend Transport; Tue, 15 Jul 2025 01:57:17 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.144)
 by boeing.com (130.76.144.198) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 15 Jul
 2025 01:57:16 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by BN2P110MB1191.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Tue, 15 Jul
 2025 08:57:14 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%5]) with mapi id 15.20.8922.025; Tue, 15 Jul 2025
 08:57:14 +0000
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
X-Inumbo-ID: bc1cb657-6159-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1752569847;
	bh=lFb4D5yNbWi0tDwbGkGDBGMNdjmxPSw9oxyhV8aAZ30=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZicDYG8t0E5WVoFYLPMPCXg0NFPPEA46iFuuh7gHLbsPc9z6DZpmJYeHQ0wjsrHoL
	 9eWtFMGN+OxF3mWDrGOvSbXK3E0WAo8GNG0pt7kCQffjtbUVUI1ZXebSFp4uVV0n0e
	 x230IiFHDd09Up+ZXZMWxYbWLSglil1bq9jqKuvotFFLbnLuzFVggLibP9de7IExvK
	 jTdmL92tPRbUnOGH5qcNl2Q6k693PQu2+m7rQHwn0esjmk6olPyrGSmj5ExJNBGwSU
	 KuqJj+4QZwEyRSUIYki8eAUr4X4C/35lO2iPj6ry+gc8axCVV7mmrk+eYWgIf5nvUn
	 MU2e3x2KKfJKg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ieTWo7kkLbW5jW/LETvn+L9HegKdr7OHsN6PYwb4fyTiznIVf3Kmf7ddO6GsA2QtiAtiismana17i/pFCXE0IZlF/nkoXtAzrXA9WY8tDknCiWgh9D8M+2Dpn0jKYFRLnOHHG8VHc3Omd/w2Znuroj8RHA6Wnzl1zrATMgvOnaNLWJZlh98cqgiY10TQEJLzpxVDNKe2/1Hd/YtiLGF8D0cYBTqwN3tOR05pZCDtlbO7Q2JnG3M5hpoRj2pQA7UswkM3a0JEi51pLovRpIDLX39/z89paZxDpK7oG6C5nq5R5vx7tRgu1Plr+4EFbksAOhyqMhfh6fz6kDHlxQ76Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFb4D5yNbWi0tDwbGkGDBGMNdjmxPSw9oxyhV8aAZ30=;
 b=utn3wef4vk9gNZlgGhbz8L4LJCFuqC/952OreBIOIOdLxH536Sjo3pGOq8WZiwwypnWOrqJn4HN9DXRtoHBH1DIpnMA8d1HlmAnvqh6y3z6pMTomPEoIriwWBNct/mrEEVmzaPr66mXd7QKckUASBbsxzQNf37kko8o84XMG9rn8x72IKWR+p1RaW671+tPygnWRKW1vCbg57D80IbgV9nwYKaxEf+vMIFYgqEbmt26rjILvXm45gzaBVoZ69VNMqbsNKVxPKEDelKYxY+rlDoOnlEWWFj9R9dutixPkT+ri+pL6ukw3ARZzz0QHrLjwirScn/pUvLVTYDX9crbhmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFb4D5yNbWi0tDwbGkGDBGMNdjmxPSw9oxyhV8aAZ30=;
 b=f/Q4HYEYwAQ9AfLOylPdEwoPtyiblH1x+1/vA5L9vL0t0zzhjiK0S3ZkVRxcsHJH1Muqr44r92vHdxOSjZXtkah39KizoxoeYLeQOjISP0Eeyd2Dsi4TaMTl65fYf4PM4eTLXhTZ0fmYxILFbiH6VM3XANPZQf1RejIvah2Vjss=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
        "Whitehead (US),
 Joshua C" <joshua.c.whitehead@boeing.com>,
        Nathan Studer
	<nathan.studer@dornerworks.com>,
        Stewart Hildebrand <stewart@stew.dk>,
        "Dario
 Faggioli" <dfaggioli@suse.com>,
        Juergen Gross <jgross@suse.com>, "George
 Dunlap" <gwd@xenproject.org>,
        "xen-devel@dornerworks.com"
	<xen-devel@dornerworks.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: Re: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
Thread-Topic: Re: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
Thread-Index: AQHb9WZ1TPq2CIkhQkqBGhWE117e3g==
Date: Tue, 15 Jul 2025 08:57:14 +0000
Message-ID: <BN0P110MB214894D609B5B992A854E9D19057A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
References: <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
 <0686ad8e-749f-45ca-a273-5f4ae718e8b9@suse.com>
In-Reply-To: <0686ad8e-749f-45ca-a273-5f4ae718e8b9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|BN2P110MB1191:EE_
x-ms-office365-filtering-correlation-id: 204d5048-65be-420f-6fe6-08ddc37d980a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?azJ0RnlvZFg3bVllem9rRk5NTUhON2J5eWxLbjNGbkxXOFE5VlcwcjkvSCth?=
 =?utf-8?B?ZUY0UmZ0b0QweUYzWW5wUlRoTnNTM0tldnl4M1gwaFZpZkV6M05OSUlrcUlT?=
 =?utf-8?B?R3J5d3NoM0dmTjVTblhJa0JuZFJ0czdzU3FmL1ZsdWhzQWJTRU9VcFJWZG95?=
 =?utf-8?B?Zzh3NHVKTmNMY1kyWHN0ZGsyUGpFL0dCRWlIckd6c0x3ODBQNHJHdnlUMzZ5?=
 =?utf-8?B?SllBcE5XYjhBOE9ZaG1jRXNvZXZldjlLZ0tjVFh6V0lweGhuNk1wOHFRM3hr?=
 =?utf-8?B?OTJuMkxjVEJmU1Z1d1ZZYzgwTXFJVC94UzlIRzNob2UvdUNMc3JZb0trYmla?=
 =?utf-8?B?dWFDMEd2NmVuUHowRDNNaXBVekwySUJrL2pJM0V6Q0h4VWo2clYrVXBQREl6?=
 =?utf-8?B?VGtmR1prVjcrUFUzVWc4VkxjK0RGVE53cjQ2UURkZXNEZEtyOXFRdGdyYU5U?=
 =?utf-8?B?L0FwcmdGOEljOFo1UHFHQWtHbDgxM2F4bHg0VTlBNWNCUmtrM1pSd0JybFVm?=
 =?utf-8?B?ZjFIQXFLRWVCK3hLbU1hdThaOGlrejcxU0N5N0F3WURwcU0zOHhlbjdCVE14?=
 =?utf-8?B?SE12U3Z2ZTgxalZ0Q25ZOSt5cUN0eU1iRnZ3ZEJ0cUtCY3dDdEM4QlRlYUo0?=
 =?utf-8?B?NlhMaTlkbTFQWDVWeHJaTERkdENVQUx3WmZlYlNrcGJYTUxrSnFjN2h0MGw0?=
 =?utf-8?B?aGc5OFZ1OVlEaDVRdE5oQVkya1d6N1hKZUdNcDlpLzR5aWc4bHpLT2FVWjFv?=
 =?utf-8?B?QVdmNnJUWU84MWRjQ2VTT0pvejdqZjRCQ29MTlhVMDVIbFpZZ0JHOFhDVGxZ?=
 =?utf-8?B?YTJHUW5Pb3F2djFHV3liOU0wYVJUaEFXUHI0WVkzZlY5bjNLS2lGT3ViRi9S?=
 =?utf-8?B?anRTbWFTWmllZkJYSFJRbDNSWjBvOGZEQnRzVzJacTNUUG9pWGsxK0Y4NVdS?=
 =?utf-8?B?Wi9oUTJGajVoc1hIQkZVKzZidC82VUc0RUNBRUhFMzhyeGdqeldSS2lFaU9o?=
 =?utf-8?B?MTdidjE4WTJ6RkRHdnJPREx3YU84YTkxWVAwRkpZWVJzeE5iODhkUmVrUStL?=
 =?utf-8?B?c21SZTZLc2U0YVpKTm01anBVQ1BwTjhXWVc4OFpQak15cjhqbDFEQWloeG1z?=
 =?utf-8?B?M3YyTWMzZUphM0E4c1UzTk53NDhxYm5JUVordzN6dUJDNkVrQ2RpM0RuZHMw?=
 =?utf-8?B?V2NXV1d0a1F0MXl4WDFORFdrQXdTdmtQWGNsdlJWUzVnQjdoTU1ldWJMWVVL?=
 =?utf-8?B?bUJGa1VBdng2b0cxYXpjTGRJVWx2YXpLL2tJbkhmbVBZQ3E5L1dwbkZXMHJo?=
 =?utf-8?B?bGJ2ZG9nYmdUR3F0dmZ6akV0bVFrVDV5UlN0aGsvaTlUM2gvYi95WG1kNWVZ?=
 =?utf-8?B?TzdhdDNBRjFINCszTllqL1A5V2xCemJKNEVCYW9NOFc3N2xsM3ZXZDZJY1Zy?=
 =?utf-8?B?SHQvQVFBN2MyL1N1aGJNVHIvN1BCaURGUUZ6OUVhRDB0QzBJU05OMWwxaVB1?=
 =?utf-8?B?ek1OUEFSNzNIR1FkQW43eDU4OUFua1Q1VnVjck45YncydllzZTl3MVQvaGdx?=
 =?utf-8?B?eHhjZUlGRk9XV3JOckdVc2MvUFlIR3NCMjAxdFNnVWduM1NHbDR5Ky9wK2Iz?=
 =?utf-8?B?RXNVQ3hqSUM3cjcyQmFKRXdTUGoyVHRzdXg3VzFxYmZIR09RQld6c0JDYXZ1?=
 =?utf-8?B?NHNMMThDdGxiOEsvT0x4SnZTRnBWVXZJd3BZaW51RUZDNGZ1VGhhQlUzNEtK?=
 =?utf-8?B?NnplOHdzODRSTUdDZCtzeUtLcC9ENHhVNzV0OFd1REpHT085T2VXTkxTUktS?=
 =?utf-8?B?TlVKMUY3cGZhd3ZDa2JpYjE2NTV3QlIvUzRVVERXVTlrZXdka1UvUlovK0o1?=
 =?utf-8?B?SEJlWno2akZwYUZvYldkbHE2d09zeU9VMDh2emVDYitRNGpsdjhWYmV6TXRp?=
 =?utf-8?B?dEdzZjJrdlkzSHczeFFtUTNJd29IUHFYN2RJbktESWtHeDFBRytrRGlKOEJL?=
 =?utf-8?B?cEgwMnJqN1pBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTFwYlE2YWRIaVIwYVllNlZWMW4vMWxQSUU0ZWpjWnNycWhUMExlZWNpZXRy?=
 =?utf-8?B?YnkwOU40OWk3ejZTSjNKTnVxelRSN0dpQk8vTGlOeUVqZDlwbHN4TTF6ZEJJ?=
 =?utf-8?B?UUlWZjllUWtwZE91S0lPczZ5aG14RXZPQ1lzUXRJYUc1QXVhLzRWU1dMcjJF?=
 =?utf-8?B?aUExYjh3Z05YY2NxNHpwRVRtS0IxMXdCOGZEY1lvZGpFQzlhdVZmZjJ3M3l1?=
 =?utf-8?B?K201OGlwNkN6L2pIc0krRzUxaUQzd3Y5R1VLSmFJbHhZK2l5dGMrNUQ1RzVV?=
 =?utf-8?B?a0J4b250bjhrci9ZdDlTeHhZNUw3ZmdBcnh2STNSQ2ovM25SWE1SSVBZYUVS?=
 =?utf-8?B?aXUxd3BsQXhSWkdKRkw2cWNCUHE2c1FQSjdsbm5EemlIYXZVZWZTUGI4bU9V?=
 =?utf-8?B?Q1NtV1krT01ia2pDQzVpTkVuWFozSFJMMi9KREd1SFpmdVovSkl3Wk5HUUpq?=
 =?utf-8?B?WGN5bFNDR3ovc2crM0V6YUhDMnAzV2xJdVF2K3FTdnNNdHhXa1U1YXZ2ZXZQ?=
 =?utf-8?B?amV1WHdYbnIzV2FjQjVIOVhSNFpJVmtKNzJZQ3d1TGJaWjZTeE5FNnovK293?=
 =?utf-8?B?V0F5V0ZzZmtqVTUzREVLb0VlaTJadWRkTGFjZG5jZm1KcHdTMldlUWxyNzlR?=
 =?utf-8?B?TFkzaTVHRnNXRjI0K2NicVBRbGpkZUduZys4K2IrYWNyV2N1Ukovampobm9U?=
 =?utf-8?B?WjUweDArZzlRbUJNbVRLdERNOTNVZDdKTisrMTZrNEZLV2VkaGpxME9OVVdp?=
 =?utf-8?B?S1FGMU54RjhhMjhvMFhPNFduc280VUhITi9nNk5wUEhFc1JLaHhINExMRHd1?=
 =?utf-8?B?ZGpCWGJ6NTRET1Q3S1ZPczE1QlgzZEp0ZkpoekladGRFcEtydG9KQTkrMHVw?=
 =?utf-8?B?bUVRdlh2ejRQRExueVNFSFJaT3JEZlBaRzA5bUIvdFhCRHdNMktKdThjVkhz?=
 =?utf-8?B?V3A3bm5hcHNuQit1dncwbTNQbEdJSXFMZzlkR0JkQldtaHZWVHhKc3dWTFNv?=
 =?utf-8?B?alZrcjhzaGpld2pjSjB1cDRuaERRYW02cERQd09HbnIwcG51cTVpSk1COVkr?=
 =?utf-8?B?bGVTNzR5T1NnSXlRRHBaM1IrbHhHZXV0WVJhR0FaM2x0VUJ4bVk1R29nbkht?=
 =?utf-8?B?Wm9jWFBsUktVQWpKaTN2RW9Ka0k3eEsyU1VTbDR2bWpKSGlXYmFQZS8vc0Zn?=
 =?utf-8?B?TzFCNlVEbFJJQUNiNWErOXl6NWgzczhBTzUzUnRRdnBuTkoxMTJNaWtETGV1?=
 =?utf-8?B?VDRhekpiaDRWcHM1bll3V09nZ0xldE9mTUs0eTN0Qk9RbFUwMjVkUEVzaE9F?=
 =?utf-8?B?M2R2RE12OVdWRHdPbXpxZnZ4eGs2cEtuS1dSdGFQUXdqcTNJM0Fta3F4eVFt?=
 =?utf-8?B?NUxLZ013TytVeXJqTCtnNW5Sa1BhZlI5cjBtSjJCVnBYTFN5VzZ2REJRUEFI?=
 =?utf-8?B?YXdKa3VFRG8xaStpelphdjJhR0lFMi91Rk1LNkZkNE1DVWVWcGVBYklXelpU?=
 =?utf-8?B?blJvMUFLTlIwdjZqZk0wMWwvbGIya0VKUG9JM2M4bmo1aXBvRXZjVm9Fb2RV?=
 =?utf-8?B?d3d6WCtVZ3NJOTlNUHcxU1RNTVpuQkZZcHBJU3dIWnRYUkhqYzNYNDJYYTk0?=
 =?utf-8?B?NUVmSDlMdmJxaEhiSjNBTHJoZ1N5WU1TWTZlZi96dERKdUZOUCtPSHhFMXow?=
 =?utf-8?B?UEpIQnJsQTFoZC9raUNBKzJFSEovMEtJbWJrWHg3bk5DY1lyRmRNOGJQQ2hs?=
 =?utf-8?B?V2JwTmNHSTNBcTc0VHhocnVibkFqL1pxdk1zdzA3TkNaL1diS1lyZXlxRHlC?=
 =?utf-8?B?NUVuWVMxRDJTcytHd2xyVnE1cVlpU2V6NEduUlFIMFkvaHNoc1A4S0NGUlEw?=
 =?utf-8?B?bGdOOGpxbUFNeDY3S1dJNlBhbnNFMzVySFhraWpGZlNYbytyTXU3dW9HOENH?=
 =?utf-8?B?Q29peWZPKytnVC93bHVmenlHQnNjN0VPUHhzV0dXRllDWERuZlJvTjhaVDg0?=
 =?utf-8?B?VmYwMlR6Z0h1NmxSRlJrSThHZGtwSk8rc0NwU3pSejZ2b0Zwd3greGpOeWtm?=
 =?utf-8?Q?+erWyU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 204d5048-65be-420f-6fe6-08ddc37d980a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 08:57:14.5168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1191
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

SmFuLA0KDQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRlcnNvbiBDaG9pIDxhbmRlcnNvbi5jaG9pQGJv
ZWluZy5jb20+DQo+PiBTdWdnZXN0ZWQtYnk6IE5hdGhhbiBTdHVkZXIgPG5hdGhhbi5zdHVkZXJA
ZG9ybmVyd29ya3MuY29tPg0KPiANCj4gTml0OiAoTW9zdCkgdGFncyBpbiBjaHJvbm9sb2dpY2Fs
IG9yZGVyLCBwbGVhc2UuDQo+IA0KDQpTb3JyeSwgSSdtIG5vdCBmdWxseSBmYW1pbGlhciB3aXRo
IHRoZSByZXZpc2lvbmluZyAvIHVwc3RyZWFtaW5nIHByb2Nlc3MgeWV0Lg0KDQpJbiB0aGlzIGNh
c2UsIHdoYXQgd291bGQgYmUgdGhlIG1vc3QgYXBwcm9wcmlhdGUgYWN0aW9uPw0KMS4gQ3JlYXRl
IGEgdjMgcGF0Y2g/DQoyLiBTZW5kIHRoZSB2MiBwYXRjaCB3aXRoIHRoZSB0YWdzIHJlb3JkZXJl
ZD8NCjMuIEV4ZXJjaXNlIHlvdXIgc3VnZ2VzdGlvbiBmcm9tIHRoZSBuZXh0IHR1cm4taW4uDQoN
ClRoYW5rcywNCkFuZGVyc29uDQoNCg0K

