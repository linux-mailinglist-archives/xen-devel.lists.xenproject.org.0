Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F010B12625
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 23:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058570.1426083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufQ4A-0007n0-Qy; Fri, 25 Jul 2025 21:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058570.1426083; Fri, 25 Jul 2025 21:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufQ4A-0007kG-OK; Fri, 25 Jul 2025 21:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1058570;
 Fri, 25 Jul 2025 21:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ysIX=2G=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ufQ49-0007kA-Nx
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 21:34:57 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3573807d-699f-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 23:34:56 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS4PR03MB8721.eurprd03.prod.outlook.com (2603:10a6:20b:58c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 21:34:53 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 21:34:53 +0000
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
X-Inumbo-ID: 3573807d-699f-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIv7aBOdxSjWthF5tw6QYIrRghhkYxWXU8dk07vFR6dgI+T2/LrTyaJX9kpwvB0wpr9Dj2UfGWtOzsTb1gSF5Z9/+RGQc7SPC2TUPeidu4J+NQoG1Ii1XwM44aYZM9Vh/pFWVPuRrRtrYNUi/i39xqajkTCXmQftJHWgPDbR8S/SMcjQ2wzP/INXmJtL0DJWYKBe8f2/Xttfm/vBkXd88DnWLuEl1jJVoaVsBXftlYYXQSNJaEmH/spdoRyNdZ9hIBBwJ9FqZI3PNOo2c3kdaD5rww660mhbbe1h9onzBCgsAGAmEY014weU8xY94Yf36hXs94gCDVYVEg6unu8Qyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbxTPFQyw5w9raXGGoaIa8EQIseKBmnidy58jenE+Sg=;
 b=VZiukfHy2n5wEY9yZntDbsQjhRFKoxFxAFhU4bRdii5WqYp95vZYLCh0vTpx6GIRi5robMy9srEKHCOAu4W/NrcsckD8XwTATgREDYU2k4e6Js4j0OyDuU+mHzEftha2wCEs9Ft++7XbhPmG0EUobZyRIpWqdQuj+Qt6iGapToEWm2HnGIRGBShGXDwESK3QL/Opk3LHqwd8DLvtLeLjywIxG6WaFSfkXtsjFFUhnTB2nE44HbMe2ITEQWkAgPY1tN2VZ/K/bSCGo9pzf9QaYqsJHia6IXNUOscUIuqEdbJ9V7Ci/M4l+KhLi0kePiuJtfCpm/UWl4u1r1K9dK8Yvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbxTPFQyw5w9raXGGoaIa8EQIseKBmnidy58jenE+Sg=;
 b=a1kZzWayMsI22ph+ZMpcOkoj3JtPH6WkkdBatZZPXzq9LRNzQL/ZbryOQOce03tisSZRGOn33kbKq6FA+jdrr8s9kZC5XfCQBTnsaDEwBJsSLxX0XX8Rbj1Fn93Vx56Z4fPlkrdGq05Uru1R4SRjAM3cvXzF1xrY2/QPZ3lNZCy/Odvi3TAUjpcy2vwP0jzUvqpTimS/o2YptH8r7gMRRgihNY1Mmjiav2zTQ8Pwno7Z+uffq6OI99HPMIwQoOtAmIc3g++SMFlObLH8fNA+h4I71XqvoqJUW+lbw8xmULRf/+dogViBfe4KHm3AgRbEg/iIeXhA+QigCcSyyJNfiA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: address MISRA C Rule 18.3 compliance
Thread-Topic: [PATCH] misra: address MISRA C Rule 18.3 compliance
Thread-Index: AQHb+7pQeGfsWWy0sUade1ju+9GDKrQ/vEEAgAOkMwA=
Date: Fri, 25 Jul 2025 21:34:52 +0000
Message-ID: <36042f23-7795-4717-be4a-cd22e52b3145@epam.com>
References:
 <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com>
 <6c7341a2-fd49-40de-8ad3-e7980d4e9e42@suse.com>
In-Reply-To: <6c7341a2-fd49-40de-8ad3-e7980d4e9e42@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS4PR03MB8721:EE_
x-ms-office365-filtering-correlation-id: bd3f91b3-f832-47de-2239-08ddcbc31773
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Yy9ETkVCcUNMUHhkQ0l4V01yYW5aYzZBQit6VW9CQ0owNXhSNXVKUjNhSVRC?=
 =?utf-8?B?MEh6SThQMm5ZYWlaMUtIM1N0ZFJoZFlxYUhqUC9HTW1Ya1NWSnp4aFAwdFBL?=
 =?utf-8?B?UHBsdldmL0lQVDg4L3ovbkVEeU1LTjhncCtYSW1PbDJCVVJrR2NyYVJmVndV?=
 =?utf-8?B?VnlJOEVWbG9BSko3eExuK0thK1ExWktRZ0ZQWlpMK1A4MVhQMXdKZEJSY0Vt?=
 =?utf-8?B?dDhXS0dFVnFBZHdCRVlJN0VlamNSeTlpTFRGdTI1cmNNRlgvSDRaQ0lacDkw?=
 =?utf-8?B?Ti9uK0dRelpLV2czckVrT0NwNzlJM2hmVjVGRHdUZTQ1SVFMS3c2VHBMNkNs?=
 =?utf-8?B?VWdNVWFuWTY1QUdWU2ZoRkJVcWwxbTFhMXF6Qm9YV3pkaDc3STVkNmREY015?=
 =?utf-8?B?K2cvQkM4cXRncUJkaTZ5K0NxVEUyOTd3bXhybmdmN0J6clVjdWRuRjJRYmlz?=
 =?utf-8?B?N3FZRENETHNrWW5kMUk2dG8yTzJ1MlBkTVRHOTg3dHpleHFJMUxGNDlsU2to?=
 =?utf-8?B?cXhRZjg4Zk9IaHp0QXNzQlpSdldXS0dWU3FXS0xaVDZ4OG9KVWZUaXpNck5j?=
 =?utf-8?B?VUpjTnNYZWFrblhXMUV4ZFhFWDNhVVlOZjYySHpVK0Vranp0dTRwMXA3QmlK?=
 =?utf-8?B?S1BMTk5DK3dYNURWcTMwNEt0ckZHOHVNMU5Wb3J4RUZBWUl1S3dUek1tVWN0?=
 =?utf-8?B?eWZyRXZIdkwxVEFLZnRrbXpkWXVBaWZkc0tJWVMxWjUwazhLSllYZGplWmpp?=
 =?utf-8?B?bEJKOXNwa1NuQUZUMWt6WXAvSXVCd1pKK2FRWWY3bXFPWUkydW5zeDU5NURs?=
 =?utf-8?B?QjB2YzY2akJPM3l6NXRyWWxFRExLRU1WQmZlNWhPKzJ6RlVYaE5xbER2NlJ5?=
 =?utf-8?B?OXF3RkY5a21mYzV1K0thVnRBM1lBUDBBTFdMSWtLRW4yQ01mT1pmUlVyZ0Zm?=
 =?utf-8?B?aUR1M21yWnVnNDByeVFJV3NBZmhMYVMwTk9VZmcxVnBGYjlaY0JhRllQcFBr?=
 =?utf-8?B?L3dyYlV0aVpRWlZNRDUveVV2VS9hYXBrVStqUitTYWhIWHBKRXcyMVhlV1M0?=
 =?utf-8?B?aHFEclZRaVdzVlg1cUlHNGZ2bW5hVHRmTGMvblc4ZVNGWUYrNWVJSWNqdGc2?=
 =?utf-8?B?VUNFb1lLejg2V0JnTW5hdkNQVXJyNzZ5T0RRY0RzK2pjUjhCekxnenhyT2N0?=
 =?utf-8?B?d05kQkd0Y1JKZmJ3WkRmOFlkMTlaUnNvL3NKUXUrc1NiTnE0NjlUaHh3RTF2?=
 =?utf-8?B?aWFRVVNDRUdwc2pwSHJLc3lzR1NzTzBxU0xFVzhRa2F0SGxWWVE4RklKajRH?=
 =?utf-8?B?NzlhOEZxOWwzS2x6U21kL3JSUk94dUtMMnhQRmtzaXhyV1c1V0pZM01HTTlI?=
 =?utf-8?B?N0haajNKUC9wU01xcW5DQml4YlE5cU5RdEJBVkV2elpEQmtxRUFtelhEQVcv?=
 =?utf-8?B?V01zRHlVWE5BdXJWd0lYWjY3OGtCQXU2U1ZkNy9PV0lVU29jb21RVkcwOTBC?=
 =?utf-8?B?Yy8yMjJqbnU2bndPSlVYczBpeUxxdFRJMnNFUVdZNzlrZlpYNFJQYnpLd0xj?=
 =?utf-8?B?dW03d2dpSFZ1T3ZMSDA2M1ZlZm5FMGFGajRLSVlraW9YSVBxeit4SWJZY3gz?=
 =?utf-8?B?MHNsdmFvYTl1WUhnNFo2WE1pc0wwN0tXOUF2MWhxN09ubWMyQW9NT0ovRGNO?=
 =?utf-8?B?ZUlXUnZJeTJDWjRDSnM3ZDZXQWt6SWUzeUVUVGJzL2VIMzhBeEdIT21NNFZ6?=
 =?utf-8?B?TzJUNlk4UkNMbkk3TGxyb3F3dzBQNTdZS1hhc3FtcEZ0QzVXWTFRa0ppNFBQ?=
 =?utf-8?B?MGNhNE93YTVNMmFCOVptemd6Zmk4TnUzbTNRNTlaYWZZMmxGOEM2RkRjZHJn?=
 =?utf-8?B?YTJJOVVRQTNVNC81aVd0c1oxWm1WNzNDeEFKakVVM2s3RFVFcjM0ejk5S3Fm?=
 =?utf-8?B?dFRnL0JxVDZpZitaMnlZRVo2YTI3YndiMk92R0ZkSUVFaGpPUDZrTDY0NGR4?=
 =?utf-8?B?eXhreWtpRVZBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEI3aGlLL2xQUzRxQm1FZ0dEaVpjeWo1UGpzdEl1MUtaSHpEc1ZWTW9sQ3hU?=
 =?utf-8?B?VTkwZ09GYW5VQzlsVytYeGJWWUZuM00zZVBnVmdHV2tLckxTaWFvWTE1anJV?=
 =?utf-8?B?U3I4ZXBoSjFqcExNZnRJaTZraFh3SlRYSk1Td3lIQWZyYVh1T2R5eElQemo4?=
 =?utf-8?B?anpiOWxOYTdNRU9TeENSTVFrTjJSdnBHSlU0UUkxMjlTQ1A1dHhJWTlXV0dz?=
 =?utf-8?B?ZXJtdTVYRWY3cXZPVWF1VnIxOUhzL0lsc0NCV21kelB1WmFmOEh3MTRvQTR1?=
 =?utf-8?B?NnlyWDFiRk0rYUx6eDQ5NGNZdWgzZURQSGx4aWdmaHhQeHNUaUl5TlUzUGI4?=
 =?utf-8?B?cGdzZnMxcVdUWEhPZXlYN3VkWGdBTFZXSEFsOGpsRkVkVnQ3NjE4aWJhOVVK?=
 =?utf-8?B?d2dHbEJqdzJ3N2dyTEVidzJreWlBVVFnbUNjRjlRWXZoZldMdml5d0ZlUVlz?=
 =?utf-8?B?bDdnOXhoMCtZZmhqc2VaUUpFTmNwaER6QkJoMVZFZzlRZ2hUMlAzYXFYKzJP?=
 =?utf-8?B?TzhSU29HTlFZbEpmeXhPdWVXMWUzVndZWERobXQ0WFNIYksrdVVydTFHYVpE?=
 =?utf-8?B?M21NR3lkZkplcm5CWEs4R0pGNFpJd01mRFY2aXVBK3dId0hCRmdBaSt6M2NH?=
 =?utf-8?B?M0Q1dFBJVDlhZVBGakE1S3FOVXlNZDZibFEyd2NmTVBHU25KRTJrK01OR3RI?=
 =?utf-8?B?dXREWHlaQkRLcVJHSW9tOXlUWXVXU2hVNFBMenF2Umx1WnMyNHhuUHJOenVh?=
 =?utf-8?B?TWNEUHBPVVRFUHl6UWZ2KzdEcEZRU1Bib0k3dlhYMGZiMXlUelRxbVIyWWVG?=
 =?utf-8?B?WGM4TGYxY0pRSGE5Q0VRZWk4WTlWbGE5ekJaZzJKa0tPbEhOTTlaYzhZNFFl?=
 =?utf-8?B?MW95eGRhTmxNb2d4dGRYNEswQWNxYXdCRTlzK3VuNFJ3WUk2Mk9XWjJJY2FJ?=
 =?utf-8?B?V2JXMWdySFRFWXlFWkFSa1B2Z0lDYXFTNFhEaDV3RXIrRHJ2MHRVdGNqNlFP?=
 =?utf-8?B?U3pLTEh1SERFeG95Y25ZN2RaQ2VrcmtOcmdoU3RJbi9pQzI2dEtBblNTZEFw?=
 =?utf-8?B?YXBOUlJtYmFtb1ZvL3dJUjdJcnBCWFFKbE9TdGlBZktCYnJTampSNndxa2hy?=
 =?utf-8?B?eWlUS0VUZXJuWDZVT2k0VjRXTHhoR1VFVEN4VHhhYmJ2WmF3VnpPbUZRaXRi?=
 =?utf-8?B?eURFOW1tK3Z5cXczYzhydTRPNDNzUnZZUGU5c2x4Mndoam9oZUxuM2tHdmhw?=
 =?utf-8?B?MTJPdmozWGdNRlRHdUFEY0NxSXhzakpxVlZxV3ZDL2d2bTBJMmpaM1RZYTNv?=
 =?utf-8?B?SWdONmJRNXg4eHVFVFUvL0NZaTBsNjRGbHpLakhRM0dkeThLZWlYRFdmcTB4?=
 =?utf-8?B?M25xeVIwZzErcUQwWGxwcEhVVEFsRlF1T0EvdDNFT2JmNGxOMXAvLzhxRS80?=
 =?utf-8?B?RktJeWVQOUpxeDNVcngybHEyU3BmTWwrZjN3TFRHV2xMV1UwTDBPK1U3cE5K?=
 =?utf-8?B?Y1lUUWlROFM0Q0x5N1ZjeTkvYmFDSlp3WDZHK3gzNnJYcloyd0t4VzJlUWpm?=
 =?utf-8?B?NEZ0RXJ6dE1IbTI0dTBBOWhOTnVZYmtNaVVhak1maTJIMFlpZFBaR3hETHUv?=
 =?utf-8?B?djVRcW8wNUk4TklJZ1hSWCtrUXAzVTBaUUxJQ1lwblZjbW11TE1DMUVDb1Jn?=
 =?utf-8?B?NlFyRXFmKzc5ZlZlTTFkMldBcEVBTksxTS9FemVIU0RDcHViNGExQTE0aHZL?=
 =?utf-8?B?U1N5MXZDTGhhTUxQVTJqbWhNblZXMWREUTZVempBanJXbzVobFFMNWR4K1BE?=
 =?utf-8?B?L3hDdloyMUNobThYaWFPNWFzR2plTy9XZzh4WVVOc1d1SmVQdUduaExTT2w5?=
 =?utf-8?B?dzMzVktFNng0RDRWNWZaUG5FdGpqSDdIMFVTbm1UNTBiS2N4UU1SaVFweUNo?=
 =?utf-8?B?RzNYdHBQQkxaUlZEYS85ZlZnMmxjNE9tSVlLL3dzK1Q2OEJHYTk1d2p5bHMx?=
 =?utf-8?B?OVlyQ3NPc3N5UGlZcklEeVE1dzdObmwrajZOaGZjNmJBVXgxZlFLMTdpMW43?=
 =?utf-8?B?ZUlIMkdSWnpXL2FXZFJjYzcvbTZvOGxWZDYzV1BYOFVySExtVFMzUEQ1U2ZE?=
 =?utf-8?B?dGNtRjZOSklEYmhRUWEwTGNmdFlqeFBMZjFoNXBOajVKb05nUEtHVHdQcWV1?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8191CBC96EBA4A40A1FDB8BC977C1886@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3f91b3-f832-47de-2239-08ddcbc31773
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 21:34:52.8669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pyxrTCiDpSOXhfgBbPH6h9CxQQv+5yBmYeXQuZoijjSrWEdcXL/+1hZcJ4OT4bPBM0ZiU2Rf3E5VT2lBKgMiAmWQ83qMybm79MBWu/7FuoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8721

DQoNCk9uIDcvMjMvMjUgMTY6NTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wNy4yMDI1
IDEyOjEyLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS9hdXRvbWF0aW9uL2Vj
bGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4+ICsrKyBiL2F1dG9tYXRpb24v
ZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPj4gQEAgLTU2OCw2ICs1Njgs
MTQgQEAgQzk5IFVuZGVmaW5lZCBCZWhhdmlvdXIgNDU6IFBvaW50ZXJzIHRoYXQgZG8gbm90IHBv
aW50IGludG8sIG9yIGp1c3QgYmV5b25kLCB0aGUNCj4+ICAgLWNvbmZpZz1NQzNBMi5SMTguMixy
ZXBvcnRzKz17c2FmZSwgImFueV9hcmVhKGFueV9sb2MoYW55X2V4cChtYWNybyhecGFnZV90b19t
Zm4kKSkpKSJ9DQo+PiAgIC1kb2NfZW5kDQo+PiAgIA0KPj4gKy1kb2NfYmVnaW49IkNvbnNpZGVy
IHJlbGF0aW9uYWwgcG9pbnRlciBjb21wYXJpc29ucyBpbiBrZXJuZWwtcmVsYXRlZCBzZWN0aW9u
cyBhcyBzYWZlIGFuZCBjb21wbGlhbnQuIg0KPj4gKy1jb25maWc9TUMzUjEuUjE4LjMscmVwb3J0
cys9e3NhZmUsICJhbnlfYXJlYShhbnlfbG9jKGFueV9leHAobWFjcm8obmFtZShpc19rZXJuZWx8
fGlzX2tlcm5lbF90ZXh0fHxpc19rZXJuZWxfcm9kYXRhfHxpc19rZXJuZWxfaW5pdHRleHQpKSkp
KSJ9DQo+PiArLWRvY19lbmQNCj4+ICsNCj4+ICstZG9jX2JlZ2luPSJBbGxvdyBkZXZpYXRpb25z
IGZvciBwb2ludGVyIGNvbXBhcmlzb25zIGluIEJVR19PTiBhbmQgQVNTRVJUIG1hY3JvcywgdHJl
YXRpbmcgdGhlbSBhcyBzYWZlIGZvciBkZWJ1Z2dpbmcgYW5kIHZhbGlkYXRpb24uIg0KPj4gKy1j
b25maWc9TUMzUjEuUjE4LjMscmVwb3J0cys9e3NhZmUsICJhbnlfYXJlYShhbnlfbG9jKGFueV9l
eHAobWFjcm8obmFtZShCVUdfT058fEFTU0VSVCkpKSkpIn0NCj4+ICstZG9jX2VuZA0KPiANCj4g
Tml0OiBEcm9wICJkZXZpYXRpb25zIGZvciIgZnJvbSB0aGUgdmVyYmFsIGRlc2NyaXB0aW9uPw0K
T2suDQoNCj4gDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgNCj4+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaA0KPj4gQEAgLTQ2MSw3ICs0NjEsOCBAQCBzdGF0
aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfZWRkKHZvaWQpDQo+PiAgICAgICAgICAgICAgICAgICBw
YXJhbXMtPmRldmljZV9wYXRoX2luZm9fbGVuZ3RoID0NCj4+ICAgICAgICAgICAgICAgICAgICAg
ICBzaXplb2Yoc3RydWN0IGVkZF9kZXZpY2VfcGFyYW1zKSAtDQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgb2Zmc2V0b2Yoc3RydWN0IGVkZF9kZXZpY2VfcGFyYW1zLCBrZXkpOw0KPj4gLSAgICAg
ICAgICAgICAgICBmb3IgKCBwID0gKGNvbnN0IHU4ICopJnBhcmFtcy0+a2V5OyBwIDwgJnBhcmFt
cy0+Y2hlY2tzdW07ICsrcCApDQo+PiArICAgICAgICAgICAgICAgIGZvciAoIHAgPSAoY29uc3Qg
dTggKikmcGFyYW1zLT5rZXk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICh1aW50cHRyX3Qp
cCA8ICh1aW50cHRyX3QpJnBhcmFtcy0+Y2hlY2tzdW07ICsrcCApDQo+IA0KPiBUaGVyZSBtZXJl
IGFkZGl0aW9uIG9mIHN1Y2ggY2FzdHMgbWFrZXMgY29kZSBtb3JlIGZyYWdpbGUgaW1vLiBXaGF0
IGFib3V0IHRoZQ0KPiBhbHRlcm5hdGl2ZSBvZiB1c2luZyAhPSBpbnN0ZWFkIG9mIDwgaGVyZT8g
SSBjZXJ0YWlubHkgcHJlZmVyIDwgaW4gc3VjaCBzaXR1YXRpb25zLA0KPiBidXQgZnVuY3Rpb25h
bGx5ICE9IG91Z2h0IHRvIGJlIGVxdWl2YWxlbnQgKGFuZCBsZXNzIGNvbnN0cmFpbmVkIGJ5IEMg
YW5kIE1pc3JhKS4NCj4gDQo+IEFzIG1lbnRpb25lZCBzZXZlcmFsIHRpbWVzIHdoZW4gZGlzY3Vz
c2luZyB0aGVzZSBydWxlcywgaXQncyBhbHNvIG5vdCBlYXN5IHRvIHNlZQ0KPiBob3cgInBvaW50
ZXJzIG9mIGRpZmZlcmVudCBvYmplY3RzIiBjb3VsZCBiZSBpbnZvbHZlZCBoZXJlOiBJdCdzIGFs
bCB3aXRoaW4NCj4gKnBhcmFtcywgaXNuJ3QgaXQ/DQpIYXJkIHRvIHNheSBzb21ldGhpbmcuIExl
dCdzIGhvbGQgdGhpcyBzbyBmYXIuDQoNCj4gDQo+IEZpbmFsbHksIHdoZW4gdG91Y2hpbmcgc3Vj
aCBjb2RlIGl0IHdvdWxkIGJlIG5pY2UgaWYgdTxOPiB3YXMgY29udmVydGVkIHRvDQo+IHVpbnQ8
Tj5fdC4NCj4gDQo+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4gKysrIGIveGVu
L2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4+IEBAIC0zNjAsNyArMzYwLDcgQEAgc3RhdGljIGFsd2F5
c19pbmxpbmUgdm9pZCBzY2hlZF9zcGluX2xvY2tfZG91YmxlKA0KPj4gICAgICAgew0KPj4gICAg
ICAgICAgICpmbGFncyA9IF9zcGluX2xvY2tfaXJxc2F2ZShsb2NrMSk7DQo+PiAgICAgICB9DQo+
PiAtICAgIGVsc2UgaWYgKCBsb2NrMSA8IGxvY2syICkNCj4+ICsgICAgZWxzZSBpZiAoICh1aW50
cHRyX3QpbG9jazEgPCAodWludHB0cl90KWxvY2syICkNCj4gDQo+IFNpbWlsYXJseSwgbm8gbWF0
dGVyIHdoYXQgQyBvciBNaXNyYSBtYXkgaGF2ZSB0byBzYXkgaGVyZSwgaW1vIHN1Y2ggY2FzdHMg
YXJlDQo+IHNpbXBseSBkYW5nZXJvdXMuIEVzcGVjaWFsbHkgd2hlbiBvcGVuLWNvZGVkLg0KV2Vs
bCwgdGhpcyBmdW5jdGlvbiAnc2NoZWRfc3Bpbl9sb2NrX2RvdWJsZScgaGFzIHRoZSBmb2xsb3dp
bmcgZGVzY3JpcHRpb246DQoiSWYgbG9ja3MgYXJlIGRpZmZlcmVudCwgdGFrZSB0aGUgb25lIHdp
dGggdGhlIGxvd2VyIGFkZHJlc3MgZmlyc3QuIg0KDQpJIHRoaW5rIGl0J3Mgc2F2ZSB0byBjb21w
YXJlIHRoZSBpbnRlZ2VyIHJlcHJlc2VudGF0aW9ucyBvZiAnbG9jazEnIGFuZCANCidsb2NrMicg
YWRkcmVzc2VzIGV4cGxpY2l0bHkgKGNhc3RpbmcgdGhlIHBvaW50ZXJzIHZhbHVlcyB0byBhbiBp
bnRlZ2VyIA0KdHlwZSkuIFdlIG5lZWQgdG8gZmluZCB0aGUgJ2xvd2VyIGFkZHJlc3MnLg0KQW55
IHJpc2tzIGhlcmU/DQoNCkRteXRybw0KPiANCj4+IC0tLSBhL3hlbi9jb21tb24vdmlydHVhbF9y
ZWdpb24uYw0KPj4gKysrIGIveGVuL2NvbW1vbi92aXJ0dWFsX3JlZ2lvbi5jDQo+PiBAQCAtODMs
OCArODMsOCBAQCBjb25zdCBzdHJ1Y3QgdmlydHVhbF9yZWdpb24gKmZpbmRfdGV4dF9yZWdpb24o
dW5zaWduZWQgbG9uZyBhZGRyKQ0KPj4gICAgICAgcmN1X3JlYWRfbG9jaygmcmN1X3ZpcnR1YWxf
cmVnaW9uX2xvY2spOw0KPj4gICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UgKCBpdGVyLCAm
dmlydHVhbF9yZWdpb25fbGlzdCwgbGlzdCApDQo+PiAgICAgICB7DQo+PiAtICAgICAgICBpZiAo
ICh2b2lkICopYWRkciA+PSBpdGVyLT50ZXh0X3N0YXJ0ICYmDQo+PiAtICAgICAgICAgICAgICh2
b2lkICopYWRkciA8ICBpdGVyLT50ZXh0X2VuZCApDQo+PiArICAgICAgICBpZiAoIGFkZHIgPj0g
KHVuc2lnbmVkIGxvbmcpaXRlci0+dGV4dF9zdGFydCAmJg0KPj4gKyAgICAgICAgICAgICBhZGRy
IDwgICh1bnNpZ25lZCBsb25nKWl0ZXItPnRleHRfZW5kICkNCj4gDQo+IENvbnNpZGVyaW5nIGZ1
cnRoZXIgY2FzdHMgdG8gdW5zaWduZWQgbG9uZyBvZiB0aGUgc2FtZSBzdHJ1Y3QgZmllbGRzLCB3
YXMgaXQNCj4gY29uc2lkZXJlZCB0byBhbHRlciB0aGUgdHlwZSBvZiB0aGUgc3RydWN0IGZpZWxk
cyBpbnN0ZWFkPw0KVGhlcmUgYXJlIHByZXNlbnQgY2FzdHMgb2Ygc3RydWN0IGZpZWxkcyAndGV4
dF9zdGFydCcgYW5kICd0ZXh0X2VuZCcgaW4gDQp0aGUgZmlsZSAneGVuL2NvbW1vbi92aXJ0dWFs
X3JlZ2lvbi5jJy4NCg0KICAgICAgICAgbW9kaWZ5X3hlbl9tYXBwaW5nc19saXRlKCh1bnNpZ25l
ZCBsb25nKXJlZ2lvbi0+dGV4dF9zdGFydCwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAodW5zaWduZWQgbG9uZylyZWdpb24tPnRleHRfZW5kLA0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFBBR0VfSFlQRVJWSVNPUl9SV1gpOw0KDQpDaGFuZ2luZyBmaWVsZHMg
dHlwZSB0byAndW5zaWduZWQgbG9uZycgd2lsbCBnaXZlIHRoZSBvcHBvcnR1bml0eSB0byANCnJl
bW92ZSBjYXN0cyBmcm9tIHNvdXJjZSBjb2RlIChtZW50aW9uZWQgYmVmb3JlKSwNCmFuZCByZW1v
dmUgJyh2b2lkKiknIGNhc3RzIGZyb20gaGVyZToNCg0KICAgICAgICAgaWYgKCAodm9pZCAqKWFk
ZHIgPj0gaXRlci0+dGV4dF9zdGFydCAmJg0KICAgICAgICAgICAgICAodm9pZCAqKWFkZHIgPCAg
aXRlci0+dGV4dF9lbmQgKQ0KDQpVbmZvcnR1bmF0ZWx5IHRoZXJlIGFyZSBwbGFjZXMgd2hlcmUg
dGhlc2UgZmllbGRzIGFyZSBpbml0aWFsaXplZCwgc28gDQpjYXN0IHRvIHRoZSAndW5zaWduZWQg
bG9uZycgc2hvdWxkIGJlIHRoZXJlLg0KRXhhbXBsZToNCiAgICAgLnRleHRfc3RhcnQgPSBfc2lu
aXR0ZXh0LA0KICAgICAudGV4dF9lbmQgPSBfZWluaXR0ZXh0LA0KYW5kDQogICAgIC50ZXh0X3N0
YXJ0ID0gX3Npbml0dGV4dCwNCiAgICAgLnRleHRfZW5kID0gX2Vpbml0dGV4dCwNCg0Kd2hlcmUN
CiAgICAgZXh0ZXJuIGNoYXIgX3Npbml0dGV4dFtdLCBfZWluaXR0ZXh0W107DQogICAgIGV4dGVy
biBjaGFyIF9zdGV4dFtdLCBfZXRleHRbXTsNCg0KU28sIG15IHByb3Bvc2l0aW9uIGlzIHRvIGFk
ZCBjYXN0IHRvICd1bnNpZ25lZCBsb25nJyBhcyBJIHByb3Bvc2VkIGluIA0KdGhpcyBwYXRjaC4N
Cg0KRG15dHJvDQo+IA0KPiBKYW4NCg==

