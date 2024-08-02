Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC692945A25
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 10:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770731.1181319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnqH-0008BX-9V; Fri, 02 Aug 2024 08:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770731.1181319; Fri, 02 Aug 2024 08:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnqH-000896-6E; Fri, 02 Aug 2024 08:40:53 +0000
Received: by outflank-mailman (input) for mailman id 770731;
 Fri, 02 Aug 2024 08:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPwv=PB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sZnqG-00088y-3K
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 08:40:52 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2412::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eab3dc43-50aa-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 10:40:50 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Fri, 2 Aug
 2024 08:40:44 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 08:40:43 +0000
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
X-Inumbo-ID: eab3dc43-50aa-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akNqHTok9XBiffGp2b6JdsGupLGfVfr8Zny3+jaLa58s6e7JiQ0yqr9UTuuGfyRMOXadcn6FMh6Bk3HVMAZkTK7n1ClQW4z9UWESm9Dvja4m9UCmQ+1iQj6R45hwNdkll98Lv6HUAamH912ZyyKvr7DJhwGPR5WPqHvswo/sg5WgwHuuZxBGqVG8Hc+UMroNFgEHFiGFFGX9MTUInd7gYLhHPP1YGWWbthAKXag5LXB4VR8DB94145JykBjhku+rHhZW9t2ZdmOp2BougZOJzWCWGN0vGoXVv+VmMJwSoyuMS+YIiKmwEELb2yNsH89BkKewOYoae7zPDb3/pelTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjrNARLvipjCR1fPnQxj2Z7bIsxRSpcV1oyuhGIdT0w=;
 b=ujnbB2ePqvd2Dy1IRsSlOM+XIyvtijnoTTMSYVGs/vHI40/jLSO2G4uphca7k1IK2GBWyhacyV2ZBvmL5MXdV/TnkHqwpjVlFd+7tEqPzpx7Ee6uiEbG5YqYCeJ9Lh/gheai7tvYzJjmjVzvSgTic/otmz6zv2lOIh68nbaPPEYwj84ZxaImAnyQI7JBYTazzsWfzoFWdS1pQjfrao2efv90s6fKEFvDJwNgEgpSMdcVQzRrnRQ1SAhcnI2Ivx+s8EZAVzSZpCHX3XOUQJcerva1s4p2SNDwunSvxKfu7kz5af0220HZis9hG76/s8h7Rk4TtdTO/RseyIAu8nP6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjrNARLvipjCR1fPnQxj2Z7bIsxRSpcV1oyuhGIdT0w=;
 b=wo0gLP+p86cMKc6pfv7y68KfUqYg+bSODrBYc2rb5czs6eqD/trBUcWzMktkJLxX5dEP9e2/RWUbZfkKpBIETycjXWn3MDW5fRf+Ue9f/b8xc2hPwyW/r0jHPveKLOS9KUJA5qGROfh0dPMeUcJYnWSHxPeTTx1Qm07jp5uZQDg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index:
 AQHa0SvUYCKIEvNO4Ei/mjm7Qit34LIQmkQAgAACPwCAAAdkgIAABG0AgAADDACAAALkgIAACfqAgAAE/oCAABpKgIAAAsoAgAAXhYCAAvm8AP//2VcAgACHGID//3+PAIAAhswA
Date: Fri, 2 Aug 2024 08:40:43 +0000
Message-ID:
 <BL1PR12MB58493838F5F7A13AC3DC80E5E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com> <ZqoF55yapMxGN_WM@macbook>
 <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com> <ZqogJVHV36ytYVP1@macbook>
 <ff922c7a-aa66-4b23-8b9f-63b0b403ff14@suse.com> <Zqo2N7CDshL7ZoMK@macbook>
 <BL1PR12MB584914D078416A5F0ECA0AE0E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZqyUxv7UcaRcksCG@macbook>
 <BL1PR12MB584967C87F8EBC9B753C7B10E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZqyaWryc_42KSnK_@macbook>
In-Reply-To: <ZqyaWryc_42KSnK_@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7828.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM4PR12MB6277:EE_
x-ms-office365-filtering-correlation-id: f2c85960-b815-4ec5-8232-08dcb2cecbd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZTd1VVh1cUJRYnJsQWp4UUk1b0Y4b3FRV250Wlk0QjBJWmhYWFpMaFRUbWdw?=
 =?utf-8?B?aTFuZzFzbDNHU0pkZEc1ODg2MDFOUzgveXVSVlE5YXorZ2FSamI1YlBOMTg1?=
 =?utf-8?B?VVUxeHowcVhtcGZHemdGSDdkMXBXaDVxa0tjZytzdXVNZEVRbGtEUzYxT1hF?=
 =?utf-8?B?WWRmb0R1TWZMTEJvdWRwTzNsRmV4WUhXT21yeDhTeHMvUEs3a2M5cHBWVlY5?=
 =?utf-8?B?M3VLM0xrcS9jcklvRnlDYXhicUZNM1p3VnBwSGdJVDAzNnp0MWZ4d29TSmdV?=
 =?utf-8?B?MFRpc3dXaVlMVzMyTURPWTFacmJMczZNRG5HajhKTG1xWHU1Kzl5RktCMjJn?=
 =?utf-8?B?OFZFUmMwV0ExL1I5dnhqYXc5djVwdlQybXNDcDlsbXY5bUtWcGJ5R2hTVmk3?=
 =?utf-8?B?WFQwQkVyalFpQkhDKzk5NUdEWFZBSU5lUVM0ZWZaRERERFRZUVJTMzh2SlhN?=
 =?utf-8?B?ZW9VbG5EWDNuQ1l3UWRkaHlYVHpRSGhzdUwxaFBHVnpsbDlYRXRxcXRoM25i?=
 =?utf-8?B?MVkyQUdXUGdpNTdhZ2tpa3UrMkoxdW9CMWw1clc5ZHlJRnk2NXRNaDFiZEZ6?=
 =?utf-8?B?MjJUUUFuUUczQWFuNnBJMTU1Q0ZQQ0g2RHVmZnc2VlBtcEV6YzJHWGM3WWFr?=
 =?utf-8?B?Vkc3UzMraUF5RHgwd2lMVVljQ0hwVlZocVZ4Y1o5SFR6VHpkcTJRZmoxclhw?=
 =?utf-8?B?U1RTYzR6bVpKWThLdnc4T3RISnFJRk9OTDQvVm5zbjAzOG5acUtYODYwK0Nj?=
 =?utf-8?B?Rk1mQzNFeVl3QVJZSlZKWjI1bC93WXlFK1R3eHMxR05ldmVjQ2RGREFKS0Y0?=
 =?utf-8?B?Zmg2cXpTeHpyMWdhV05wWVNsZFRSSUE1Z0x6VStFTk9lSHhRYVFORHQ2VGpK?=
 =?utf-8?B?TEk1aHczTlF0L3k2RzFiTVRVcnN1c3Y3YXEreU9FUU1UK2JuNk92bEVGVXNi?=
 =?utf-8?B?aS8yR3JIOUxQd0s5V1lQcU5LWWEzb1A1L0ZjWGRKdXIxMkxUQUNaMHFKcmJs?=
 =?utf-8?B?T1RNZFRPV3o1eExURmhvN0NnT25pVE9Ib1JGc1JKY2JFM3BQRzNMUUZFeTQ4?=
 =?utf-8?B?S1hsbVdyNmczcVp5L2ZDb0xhVXJIYUkydEhXdG1RczRDc09RUzlGa2RjWklK?=
 =?utf-8?B?ekpjWkc1T3MvcGp0THBrUlY2RjhjMXZRSmlLeUVZM0NmMjYwakhBaVJ1azB6?=
 =?utf-8?B?eEtZbXhUNzBURTg5dnpDR2NzRkVJUEhscjV3dzBVTUptTXN2SlpMUmhKQXhD?=
 =?utf-8?B?dUZ5Z21HNmxGUTIxSDNxVWVROWNJbUM3amRURXVBd1dFa0xISHJvc1BWTmNz?=
 =?utf-8?B?RHFpaTByNTlXdFZ1Z0VXOTRPNFlJSUIzdmxOcGQvK2U2dUxoVkRIWC9CMm41?=
 =?utf-8?B?VXkwUjhmQjE4QzRwOGlpcWRPazNvVXBPaGtGakplazZuRG4ybjNQNjVNMDZN?=
 =?utf-8?B?a21Ta2RTc1JaTm9MTk9BanNzbDI2ZWJ1cXBrVzJ1aWgvbGpuZHRTcHhiQ2lO?=
 =?utf-8?B?OHNtYWZiek1ZcHJ6MmhEWUluUmtjSllsTkpQNWtzR3FrTENEa2Vzb3pocFd5?=
 =?utf-8?B?b2diUUQzcWgxUFRFeVdOTmZhVXI5bVFYYlRpWW9UZmRweGNNZzh4RWgxYUFj?=
 =?utf-8?B?cXErUDJRNWtkZ3BsVHBaMzduNWU2cnJNNXNGNWk2WlpvLzlZOVFmb2d3RDZW?=
 =?utf-8?B?NDFlMEtsQVViVGtuNFlnL2t4NjBZd2ovUWJNRnFNZmZ4QWd4Y1UyZVFENGhj?=
 =?utf-8?B?bExxODlwNXY1cXRpQVIydHlKNmZWVWRPK1E0eGlwY3d4cHorYk95REdZOGJN?=
 =?utf-8?B?K2dvZit2aksxZFljcmdObzZWK3AwdGhENkVFLytBV21YTURFUkx6Mjhucm1L?=
 =?utf-8?B?RlRVWFl5ekRVbEZlVzhUcWRnWSs1UXpXRkEwUGdpRDZ1b0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2FDVXp0ejNjN0JRbDNmTnBiM3V3R04ycHcrcGc0SHdvbURPWFdHTGZTdGRh?=
 =?utf-8?B?QmNyOWNsQ01CZ3J6RElFODZHa25HK2t6bStUYWZwM3NPelhQOEJYRFQ1eXBx?=
 =?utf-8?B?ZG45NDFGOHNYd0l6RTE2Y3RVN1h0TUIvT2p1N2pCNmovb0NRVEFuazc2dUtF?=
 =?utf-8?B?VHN5RmxNRWdsdzZyejIyNmE4V255SURNS25xaGtpYkMxdUtYN0lkUVRRUUI3?=
 =?utf-8?B?di85NVBUSDhkOUt1MDc5R1BucHhHKy9TMURFejBtTDM0Z3A5bGZqWkhZMnJo?=
 =?utf-8?B?d3Z2UFJudEVhNGVkOUhmdmR1YjlWOEo5RWJZOXdUL01LTXU1UThRNFJrY2N3?=
 =?utf-8?B?VkxZYkdSSllmSURxRlh5WGZJbXhnQlJHekxyK2wrdXBZR2h0SXE1SCthcjlJ?=
 =?utf-8?B?ZmtlLzlKS3lWU29wMEVKVGh3dytWRnBzMzVxUnBEYVpiSW1BRXpuRzNYSWlz?=
 =?utf-8?B?dUljYTFqY2haNlcwWWppeHhuMUtTaE1lRWttakZMQVU0d2xkbk5EVVlyTEVP?=
 =?utf-8?B?cUxtZGVNZ2pPZWNpN21PNWpubVV3TnVQY0hPRFAzcldxSDRuN3lYTy8xSFcx?=
 =?utf-8?B?TTZaK240T0x3VlhoRDlTU01rS1Zyb2l6REpGby9SQTJzUnVCQzQ5TDJJMHZF?=
 =?utf-8?B?Mi9uV09BUXpRSWh2UFZlbFh4MzVYajJoZ0pONVlueFlLN3UreURRMzZDMnR1?=
 =?utf-8?B?bTJLMW9VaEVXbVZNTlpLS3JOQ0JFdHBtUDlzOG1UdE1VU3BOdEtCTE1kVlFB?=
 =?utf-8?B?WThCbGN1Q2YyUFk2QmF3NmtOZmxFb29HUk1LY1Y0QXBFR0FySGt2b25lQ0JN?=
 =?utf-8?B?d014YXY5MFJERGlxdFNwZXNHSVNKU3doRkhCVDJGK0piekxxLytuUmxEWmp2?=
 =?utf-8?B?eW1lTjJkQWFZTnVUY2VMazEyN01FOFplMk5KRmU1clpJSDhLcnc2SDd1Qm5I?=
 =?utf-8?B?RENqUUZNZWVLTVVLK3VkSGhRSHZRMlVMUDR5djkyOWxYSnhUTFFIN1lSRXBY?=
 =?utf-8?B?cWMzM3dJOHAzT2hjQS9OVHJjZzRxRkg2V1h2OFYzREwzVm0xUjhMaWpQeTdx?=
 =?utf-8?B?TlphVmhzYWVrVnFkZEhHa3kwK1MzTE9na0lISEdrZCt5RmZtbmQ5d3R4MEhW?=
 =?utf-8?B?UU80TG5wd0w4TTlYOXhOR0NGWVlGR2N4UG5zRVhkTUl5dmh3SVFZNENHdVNQ?=
 =?utf-8?B?elRSOXR6WU43bXlZbWJvbndHMStLYUhRc2JTZHc2U1U5TjdMMmNnYy8vNHdG?=
 =?utf-8?B?d0hHeEZ5OEExaFoxRmtMb2tuOXhlSklPOG9wdDdMaXAzOFNuaTkwbThrTWlo?=
 =?utf-8?B?UEFkY0VIVG5FQWJDb3l6WGxXeHFaU3B1YnAxb3pyK0xFM0JxMGQ0bHpGYldL?=
 =?utf-8?B?bDJQcVluOGRqQXdhZ04rUklFSFN1SjZzbUEzcnlEc3ZSNnQ2NTNndjZlUDhP?=
 =?utf-8?B?TDlaNmI2S1FPVWRLZjhCaEEwRjVQWi9ERTJiOG5HSFpwZUFSVmZnL2owMkxH?=
 =?utf-8?B?SGpvNzN3RXFpalZGZklNcDFSbXhzRGgwUnpzT1QvNTA0NXhqNlc5dFBoWUJ0?=
 =?utf-8?B?ZU96TjNXaEo0ejdMNWxXZVYycW9Ja0pYbGlzUFFQZnhURW5LU1JIWFNjV1lh?=
 =?utf-8?B?RTZlME5WWTkrbWQrZlUrQTJKNm1QUGs1WnJrVDlRS20reDNkbnVxZ2cxSElG?=
 =?utf-8?B?ZWV5c1d3ZG9LQlBuUXp2dVRMZWdDblY1a2ZIekVBUnVibFA5ZWRJYnhCY1No?=
 =?utf-8?B?YnhRbDF1RFlJcG9IS1BZSFNLa055YWNGdEJpbmtKU2w4ckt3bkg0eGxLWUFh?=
 =?utf-8?B?V3VMSThnRGU4SUtxcmtXbFp1RVlsNVFRL0FSdTMrM1ErUkxsTzhNVE0vZjFl?=
 =?utf-8?B?cmd5TTdxQzJGWk5vdmpQSzJkVUg4NW9CSzFmeERUZmZwWHhoU1h1NGp4azU1?=
 =?utf-8?B?OS9iR0hSWnIyZC8zeHlJWjlxaHh6S2JhaFZaampRc1FHL3VFdHcxMk1LN0gz?=
 =?utf-8?B?V3ZPeWVLUVB5R2IwcXNSbTh0QXZFNGF5QVZoRnRDS1ppS2dBanFDTm02N0hU?=
 =?utf-8?B?dGliVEM0SXRGZE9NZm45V3FERTB0d2hkWlRuM1NGdFBkOWpJbU5RTkJyUE95?=
 =?utf-8?Q?Buzw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0AE57069F6D0A479DB0927B240A7B68@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c85960-b815-4ec5-8232-08dcb2cecbd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 08:40:43.1756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lKTE1+4k38njYf/tpHRL9MhfMzQvmOTnCwCsaUsGQY07VIwqcq8xl34MzOOZNeB6GOcLgvkSso8fCYawNrvI5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277

SGkgSmFuLA0KDQpPbiAyMDI0LzgvMiAxNjozNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4g
T24gRnJpLCBBdWcgMDIsIDIwMjQgYXQgMDg6MTc6MTVBTSArMDAwMCwgQ2hlbiwgSmlxaWFuIHdy
b3RlOg0KPj4gT24gMjAyNC84LzIgMTY6MTEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4g
SSB0aGluayB0aGlzIHBhdGNoIG5lZWRzIHRvIGJlIGFkanVzdGVkIHRvIGRyb3AgdGhlIGNoYW5n
ZSB0bw0KPj4+IHhlbi9hcmNoL3g4Ni9waHlzZGV2LmMsIGFzIGp1c3QgYWxsb3dpbmcgUEhZU0RF
Vk9QX3ssdW59bWFwX3BpcnENCj4+PiB3aXRob3V0IGFueSBjaGFuZ2UgdG8gZG9fcGh5c2Rldl9v
cCgpIHNob3VsZCByZXN1bHQgaW4gdGhlIGNvcnJlY3QNCj4+PiBiZWhhdmlvci4NCj4+IERvIHlv
dSBtZWFuIHRoYXQgSSBkb24ndCBuZWVkIHRvIGFkZCBhbnkgZnVydGhlciByZXN0cmljdGlvbnMg
aW4gZG9fcGh5c2Rldl9vcCgpLCBqdXN0IHNpbXBseSBhbGxvdyBQSFlTREVWT1Bfeyx1bn1tYXBf
cGlycSBpbiBodm1fcGh5c2Rldl9vcCgpID8NCj4gDQo+IFRoYXQncyBteSB1bmRlcnN0YW5kaW5n
LCB5ZXMsIG5vIGZ1cnRoZXIgcmVzdHJpY3Rpb25zIHNob3VsZCBiZSBhZGRlZC4NCg0KQXJlIHlv
dSBva2V5IHdpdGggdGhpcz8NCg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0KLS0gDQpCZXN0IHJl
Z2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

