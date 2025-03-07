Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62307A562EA
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 09:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904722.1312567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTNu-0001yR-Nn; Fri, 07 Mar 2025 08:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904722.1312567; Fri, 07 Mar 2025 08:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTNu-0001w9-KW; Fri, 07 Mar 2025 08:48:46 +0000
Received: by outflank-mailman (input) for mailman id 904722;
 Fri, 07 Mar 2025 08:48:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rsP0=V2=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tqTNt-0001Uy-Vu
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 08:48:46 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f815ceda-fb30-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 09:48:41 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB10092.eurprd03.prod.outlook.com
 (2603:10a6:102:364::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 08:48:38 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 08:48:37 +0000
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
X-Inumbo-ID: f815ceda-fb30-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGYIUJNWYeVEw4p4DW8xH0a4fdX4KLvp2Yk0VOsWl/HXfknuUd0BFbH2eajWUQp61obZAaY1LEA3o7YtRLc0rMgUIQtIhZkMdJC7YL2pfLyjIGR1frubgiaREFPiLnw4TEXf7W/yz7g8koufI8kCBM523upagoyO1zoaDOCix7H7vfT0JjiocwGmWb+2CtquZhdggp/yvbaeAEShuCoK/VZVvBjS8OoizXOAEzEKrZp6Ecc4NBrkr/HXIijOcEU/9ZGA7rcyz4byeH8uStAGputqa3EqEOF98G+u/y3yVrT7u0vgzgjD3RpR0lngvECZZ3LZZOsmvybSNWU42ViCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwqUn+tjSSJwzBz/LNrZZj3l5GIStUn+SSRfJzFqDBw=;
 b=sXJC8l7eoF+LwECNlStNEuKC6X8KxUe5XH1NKCqHikzkH9BrjHLkZF5eVKxWGg/eDCfT5G5BwRQo4sHl0euuVHcpc1mdZQnmYVcKtRXdQfm6RHBXHuCABP/DVAnh21T/ZOS1u6qb4wLO6ms0j7gM/1N0VdsTSktMSaHiT9pdphi5eGlGdjSAYI3m6UcqgtqulErY4J4SuDhkE6a/F0+8ZLQW0hx29MotzBnE1fQmNoRdXSwuXP5B49+DcT3LT4GwTbG0RLLMAf4vYfNTW+ahdJcwVtir407FAgwNlC5151j+T6PAP23LVrjRExRuNrmx8fa9cHhZnDMW9I/rZ3limw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwqUn+tjSSJwzBz/LNrZZj3l5GIStUn+SSRfJzFqDBw=;
 b=kAHMJ71eHJNPO+1QBhNHrKc2Y57ANw6Y71XZcBW7/j42BY0X/LMcc68GKolBosquxsM18vDHzJQNRU0Dx8Im+ujNBacCZlR+wjLWTg6gJGGg7TN49vd7uwVEhrauE4BU4sunQpi/RSld76Osi6nqviUrimYcbtlSID4SNMI8Old7rzvNNVF6mEbRpSZxLdH30X3Vz97+EkX1fLSansD+0glIWrpzBn6MzYlc1bdrmYtPptnbhSP6d+5Rq0NORXOjv95c+FC5DEX1ntOHinvp+WzPQE0JOpwc2l4X8ira4w2bU8FkJX/HS99+IJuKFKSdihf2mtRlT3WcnE9T7s3JAA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/7] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Topic: [PATCH 4/7] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Index: AQHbhp0OJEwwd7KbIUWidoI1k6AKJ7NmiwSAgADjMIA=
Date: Fri, 7 Mar 2025 08:48:37 +0000
Message-ID: <f6d1d6f7-5118-4b5e-a748-68eb4625593d@epam.com>
References: <cover.1740382735.git.mykyta_poturai@epam.com>
 <8e567e7db48ba6d268c5e3a3481d53d891524d68.1740382735.git.mykyta_poturai@epam.com>
 <a2092d85-9b4d-40d3-883e-60207d2e3412@amd.com>
In-Reply-To: <a2092d85-9b4d-40d3-883e-60207d2e3412@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB10092:EE_
x-ms-office365-filtering-correlation-id: 0622d296-f1b5-4e07-d234-08dd5d54da53
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NDJlc1FOdnp3TmR2QTBZNXpKUmR5UjZ2NlozdEdYQlNTUXNOK2NZdmlzQllw?=
 =?utf-8?B?TUNRNGo5c0JETVM1Q3UrQWlZTytHakxUS3U0ajVMZjJBekpCWW1nUU1neXNO?=
 =?utf-8?B?V1dMYVBpc3laZ1VQRC9lY3dEWTVQc042c25sU1dRUzBCazJuaEhGREJOb0U2?=
 =?utf-8?B?UjBLZVlZQ2VpczBaVXFtYnhSTDBFUlpyQVpWa2ZpYm4rNTZvZG9aaVVyQmdI?=
 =?utf-8?B?N212T3VRKzlCSXRjUjI4N3dIVG55dGp5VkpCaXdiUTUyc0VWcUJ2NDhldWtx?=
 =?utf-8?B?UnVEMTFBNG85akdlNXpNWDNTc3FDam5wL1pzQW8ybTJCaVFCbUtHUUpReWlM?=
 =?utf-8?B?c1FWTFFpMXhrUjFRZm5ENkFXUFdIK0lXUUFjL0xGNGFrUjFZSXJad0RjcG1H?=
 =?utf-8?B?T1BtcjU1VWl0YWxnenNhdktnMUVXYjkvRll3TzF4QS9kbTZUSGtWMlpyOGZw?=
 =?utf-8?B?Q1QwNm1vb3EyUGg2Q2NSRitzSFBuRGlLNURZTWh3T1diK0JyUlhKejB1d1Fa?=
 =?utf-8?B?eE9mbW1XOTRDVTJwTzllWTU3YTNrZjNWb2FoTnk2SE1jZWxzdVZ0UVM1MmdV?=
 =?utf-8?B?NWFjamMycC92NlNhb0s3OFVaZ0NCT1NkRlZDMy9pVURIQ3FnM0NDc3Q4ZHBi?=
 =?utf-8?B?TllvcjVKNGkxMmhpY1g3UGVsc3p4S2doN0lXWWNtYW5NTldaWVI4T0VWODBD?=
 =?utf-8?B?Q1Bubm1ucGpPbUw3bWxXcWlocTdoRnpSUSt0cW41T2poUWE1Rk5qd2EzYkZU?=
 =?utf-8?B?NDB6RFRneUpxVnhBeWcyWHN4UnhSWDN5ZHFRUHRpa0c4V1pTWHhSdzZMbEJo?=
 =?utf-8?B?TksyM1g2QXVhQ0ZSUENWREs2S1Z2WkNqOE1OdmE4YnNZRExjWG9GNjVmNndx?=
 =?utf-8?B?enlxRHI3QmRqaGRKMG1IWUlHelRUOENnbG85S01KRnhxM1psUm42aGlCNzVY?=
 =?utf-8?B?QXNpN3A5ZUNHUmE5TkkxZmZVamZ3U2hrOTFXTFJvOTZCdVhmcmswV01jbVRM?=
 =?utf-8?B?NmJSUDFsemJvQ2JyV0VKWUxHOU5aWDVMYW1yN1pyYlkwcGh2VmQ4YjBmYWc2?=
 =?utf-8?B?NTQyeVI4d0kyOFdwMldxamc3aXhQby9jOWlpUlhaK2ZGUm9ycWYvK1BPNzEy?=
 =?utf-8?B?SlJVN0NGWjV6UnUwSUszQk5nS3FJM24rZWJoSi95OGR4YU52Um5WZVNncVNT?=
 =?utf-8?B?cGhrQ2g2ZGxzN016UzQ4V1ZzSTV1am0wQkhmei8wdVRNYmF3cE5KRW9oZ0dk?=
 =?utf-8?B?bjZqNmFVT1p2QkxJazdFQ2w1SVBFb1UvUmJBYUI3TGZ5cnJJMURKWVMxcDhX?=
 =?utf-8?B?NXd0U2JIQXVuTDQrT2NyOU1VOU9mL3lYU29oa2t2Sk42T1owb3krdFdjcVVk?=
 =?utf-8?B?cExZZVdMc2RDMFBzbXlzK2tPWjdyRjFQdzFSVy9TTEdwSFFPL1pkeEg2ODBP?=
 =?utf-8?B?emIwdGZPZ3NmdElmeXkybXNEOFczTlB4WkJSd0E4clQ1OUtNQXJtUHd2QmZI?=
 =?utf-8?B?azMvQnBUQjBBMm1GQ21hblQwU0doKzE5dFJ5WitOczBxTXVpWmJQYWJUS1dN?=
 =?utf-8?B?dlE5U0h0QjBLVXAxTllvaXRleWhiT2FIR3YzODhwTDExb2tVU1ZCOEZrOE01?=
 =?utf-8?B?WFZ6S2J1NHlsOW5tL3UxNkQ1VkVMYzdFbjRBelljR3g0L25ORFJRNFJHZ3dx?=
 =?utf-8?B?emZoYnFHdkFYczQwaHE4Qi9Ea0srNVgvOVVGbmViRzdpMDhiMEh2K3cyZVJB?=
 =?utf-8?B?QWhWRXNFa3RWc1VaeTNiZGdKMWV3Zll0c3pHRGUvWjRKRFB5dlJ3aVVudFlI?=
 =?utf-8?B?dmVhVTZSZFM4bG9JNG5JUEJhRU5TNXBMaHFzWWQwbHBnTGN6Ky9IWG9TZWJo?=
 =?utf-8?B?SDh5cUZOcitGTElxMlFMSEdNbTRVTTlXRmxBRlM2TCsvNFlscjFqMHhIT3Iw?=
 =?utf-8?Q?7Ry1ZFkpf6bhLWE5RVPHciSIc0gn/3Pj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OEl6QjJjbWdGa1JQRFovQ2llR1F6MGtlTUdhUkR3SVM1cTdjUitubmdXSy83?=
 =?utf-8?B?U2ZtbzhQbmJlaWZrdm5XSmZiangvMFNNNEpUN0JyL1A4K0x1N2txTDFTVkJ0?=
 =?utf-8?B?UERSQ0VRMUQ1ZURnbmcwekJzR1dwczNKQjVCNzNOQjNqb05NQktIUytDek85?=
 =?utf-8?B?S1BEd1lpL3FXZnREdkN4WGh3bGR5c1BUZ0lvNDFhM1RIOHhPRW9vVDQyUVln?=
 =?utf-8?B?d25lakdBL20zZC9sTzBORkNIUmtUcjV5bjZJWnM4cTRGRDI4WmV3Q1oxM1k4?=
 =?utf-8?B?bzZmbjBHQ0cwUy9FV3k5NkFmOWF0VVdTaHM1cGlQRnRNZG90UFRKdDF5aG5C?=
 =?utf-8?B?ZGdzdlNYUEhPdFFFeWU3OU10aC9vMWdtSThOSUZYOWtKWDBrblkzTno1dnFL?=
 =?utf-8?B?aFptQTVVVmpjWnFnT3FWRDlMSkQvVTd3UERXTjBrMjA3ZEo0MDhWSEMvaXFN?=
 =?utf-8?B?QUpFWDc0Q0Q0Q2FkNVFuU3o5cWhMNE9uUUFCZ2xJNEd4VnVEUzB5Q0R3UDYv?=
 =?utf-8?B?WTY3Sk5YOENSY0l2TWdzdUxCNUJyZ1VubngySk9nV3ZFQUpiRXYxSmFRNjdH?=
 =?utf-8?B?bUQrOVQzVW13Z2J3NW90UENnTlM2bkFDU0hJOG55dGtIb2ZSMk9NYnFXTXVX?=
 =?utf-8?B?NGpvcEEzaFVodzM1ODJmQnEzbC9oSkg3NDZjQmRRRFZhL1VDTzhHb2tEclZn?=
 =?utf-8?B?MlkzQVFmajFHay9xeWc5dXZqZnYrSG9oYWpPWVptVGoyc09SNGx6Wlg3cDhS?=
 =?utf-8?B?M3RpMWY3UjkvSzNEeEErdy9mRWY0dkt4RGIrTzBwNi9BeURjT2h3aEZITkND?=
 =?utf-8?B?cUJHeC9mdThqV21BUlM5VmJTb1hMUU5NY1hkMHJNSGZzTURUTmtKZzAxRzY1?=
 =?utf-8?B?MGhhVTVMQ3NnVW01OVJDNlRsM0hlZzJIcGQySy9jdVNLbnJaWXJsWlZxeG1H?=
 =?utf-8?B?SWFDTjR0VnBIOVNtdTlSWnZJeldjN1ZzQ1lHREhZYlJIT3ZZV0VBaW1hUWhw?=
 =?utf-8?B?ZTJNcnk2ZENEa0QzTFJPbjl1SExDdTYyVXNVUEhZaWduMlhpT2hXY0dGb0pT?=
 =?utf-8?B?RDlCR2lNb2dycnl6YUlrUlVwdnhTMVVnQktYTGJrNmU3SWdCT0lMNi9oN2ha?=
 =?utf-8?B?R1VsYXY4WFNNaytHeFNMWFhpOWpqbXlFbEl1eCtablgrUXBCQSttekZHa2M3?=
 =?utf-8?B?NFBSTktEUCsvZ2xVZDlhVTBLbzJQZ3B5MnM0WTAycS9zRVVESnQxeWlxaVZL?=
 =?utf-8?B?a2pTQ0xyNEo5azlqRHFhdWs5UlJiZGJrQmxianNCQXdlMTBwbnhnSHBLaHp3?=
 =?utf-8?B?QU9WclRPOU1DbkhGUlIyRFE5bXNCQ0lTa2ZPZTJHMTJWU3NzbTVUdDdCazB4?=
 =?utf-8?B?aS95ZWsybWJTMngzVWVkQm43anVJNjlVNmVMQTY0L3Q1aHlLc0pqbXVpejd5?=
 =?utf-8?B?Ulg5ZXJEMmo3aWJrOExnYjd4RlBqdmMwanczdGh0UFc5alVtdlJhbXdiK2J2?=
 =?utf-8?B?Wm80am04clM2K1IyQWtUU29SNVRFQUZwdG0yLzdOVVY4TTdhVG1wYU02KzU1?=
 =?utf-8?B?WW5uUDFSLy9IY3dFM1ZLc1hzbzlYWVBmZ0RhZG5OL2NJaHpvR1RvSjFNK21W?=
 =?utf-8?B?MEFzV2s3eFp3MUYrM05zRzVZaStkcjd2TDJJbUl1WE1PNUtnMWd6S1RXbjBS?=
 =?utf-8?B?M0t1bkdtaVB3dEF0amVyTlN4Wlp3WERpVWxxRHZkSHF2ZWc0TkwzUDNWd0Jx?=
 =?utf-8?B?SmR5NHVZNkEyK2dPODBsV3RjcU5XMzZFeUVOUjdsRXBudmVaV1JCZXVTTWl5?=
 =?utf-8?B?V0xMVGRhN1Q4TmR4U2FKQTBiSWY3NzFyaVZ0b3hBYkV5VFJMZW9aa3JoY25m?=
 =?utf-8?B?QzF0T1Vna21ac282V2ZJSFJwR25aMGVNZmVmS0RBZStidDNHWlhqK1NhbE9C?=
 =?utf-8?B?MWdOeTdGWktiaVlpRWxJWHpsUGRPRXNDbFcwZjVZVDRQeWZ1UUVnZExSTHJo?=
 =?utf-8?B?eVlNNzlCNU96S1pXcVlXU2JnY3pxcW5uY2w0cVpuOVl3VWdKNDlIZmR6TCtx?=
 =?utf-8?B?QUZTV25ybUJxLzFvNnRnNWFWMHZwUDZtMUVqa0NvSkhHbGRNMkZRMUVQWkIv?=
 =?utf-8?B?UVZOVitLaHEyKzZ2WkY1RVJYSHRsWnU3ZmNVQlcrNm04NUlFMW9aUU1XVkpX?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46A62DAAC559F6459120DB60FADE23BD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0622d296-f1b5-4e07-d234-08dd5d54da53
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 08:48:37.7793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JaHiFisvuS9loo6luGtmFdvelqUb69fKBwiB17Qhdd74m4HvjXA9e5seE/dMxMwhfrcMdVb7hvHyeMzkKmhpfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10092

T24gMDYuMDMuMjUgMjE6MTUsIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToNCj4gT24gMi8yNC8y
NSAwNDoxOCwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gQWRkIHN1
cHBvcnQgZm9yIFJlbmVzYXMgUi1DYXIgR2VuNCBQQ0kgaG9zdCBjb250cm9sbGVyLg0KPj4gUzQg
YW5kIFY0SCBTb0NzIGFyZSBzdXBwb3J0ZWQuDQo+PiBJbXBsZW1lbnQgY29uZmlnIHJlYWQvd3Jp
dGUgb3BlcmF0aW9ucyBmb3IgYm90aCByb290IGFuZCBjaGlsZCBidXNlcy4NCj4+IEZvciBhY2Nl
c3NpbmcgdGhlIGNoaWxkIGJ1cywgaUFUVSBpcyB1c2VkIGZvciBhZGRyZXNzIHRyYW5zbGF0aW9u
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IE15a3l0YSBQb3R1
cmFpIDxteWt5dGFfcG90dXJhaUBlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gICB4ZW4vYXJjaC9hcm0v
cGNpL01ha2VmaWxlICAgICAgICAgfCAgIDEgKw0KPj4gICB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1o
b3N0LXJjYXI0LmMgfCA1MjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIDIg
ZmlsZXMgY2hhbmdlZCwgNTMwIGluc2VydGlvbnMoKykNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHhlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtcmNhcjQuYw0KPiANCj4gQ2FuIGFueSBwYXJ0cyBv
ZiB0aGlzIHBvdGVudGlhbGx5IGJlIHJldXNlZCBmb3Igb3RoZXIgZGVzaWdud2FyZS1iYXNlZA0K
PiBQQ0llIGNvbnRyb2xsZXJzPyBJZiBzbywgY291bGQgdGhvc2UgcGFydHMgYmUgbW92ZWQgdG8g
YSBzZXBhcmF0ZSBmaWxlPw0KDQpHcmVhdCBpZGVhISBJIHdpbGwgdHJ5IHRvIGRvIGEgc2VwYXJh
dGlvbiBzaW1pbGFyIHRvIGhvdyBpdCdzIGRvbmUgaW4gTGludXguDQoNCi0tIA0KTXlreXRh

