Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C37B397C0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097846.1452035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYVi-0001lN-SO; Thu, 28 Aug 2025 09:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097846.1452035; Thu, 28 Aug 2025 09:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYVi-0001ij-Pa; Thu, 28 Aug 2025 09:01:34 +0000
Received: by outflank-mailman (input) for mailman id 1097846;
 Thu, 28 Aug 2025 09:01:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRvb=3I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1urYVh-0001id-9i
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:01:33 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96e7ca68-83ed-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 11:01:31 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI2PR03MB10668.eurprd03.prod.outlook.com (2603:10a6:800:270::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 28 Aug
 2025 09:01:28 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 09:01:28 +0000
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
X-Inumbo-ID: 96e7ca68-83ed-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4T60U8wv6A+s414rsQXU2pD7Ol6BMWAgENtVECm4LA491jYVeOVnngbObAN5a3zhAZ6idW3CnellSMfAWg+hgNt6rQcs/KrvOJxoADNoYxLaKlQ1INW6gT8A8J1Eb3Vx8bKIPJ78vZn8p1L+I7Uho0tmPM5M+xP1cl/qMZya77mZajfQlrnb8f/kd+NZPk7KyOubZ8f1MwRn/FbkaaaVVrn1uL65AWHBO0C8vpzIkxCK0jhEULsdVSCRoZKsp6n6F8jLEMQkzusUot/ZvV46IzqTIui05Oz/r7ikSLKvhhG0PPoS4+c1+vHvSbLa9Jk7wwwVNeGy1PE6ZYNU2FXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1pVTqEwqo04a7XIAi1BP6JzpupGuwX7dTZeMjUnZoo=;
 b=LSq1OP0V+fJoUi3T+R+E6S9Qly1ss+SCEkaGHvk29sGKZaGv4yDRaUDSMdp1Nk8P5z7R2fRARnwIeFqloQqurFJANPdJ+xrDTcvcsNQVCulhzlPeOBKV51zOIdI8h1yZwRHiOXHuaBd7XebcxZlKbrdgRUDQR1EVI85m//a5u+Hv+doG8Fj5j2Y+pEdOilQCJdlCuFjdPSzQE4B09E5yhF3vu6wYIsobvuUWgJUKQEYk5N9eXh2hJHHu1EEvVETHwUTS/za9RlivFCS+idIQo2PQTyTjbwlt0lMY3fbk/QxCdCL2kBr45S2YEaLfCQvBboZhLmPMYL3uwH0bFMbLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1pVTqEwqo04a7XIAi1BP6JzpupGuwX7dTZeMjUnZoo=;
 b=vMTwIBngZoL5wRtB2h6PBHBwRC9Yl7KDVzgjtJ60XFmMasu9wFTbaRHjkLBmm5kr9PXxWUDogfnO+r09hALZ/EPUT9TNZkmrAnPnBpCO92ToH4xcQEM8LaZIx+47IVSSpHsKtGrRSLqtt7FhWAXJk8JCwrpca8yS1hrXmif4Z3sfQj0ZBNkD3PZqbRT8M3F0tBYK0rGKvAUeuiACi6VTUoU899hEXrqe7Cv0493zv+8baxly1Rgonl7GiW/6OlvNKRHBqmp3rA3KbXsMHD4ebj6HSsAkvI3NueNaML4Qvbyoj1fCXKd0uB2M24t68yILKAzAsKIW+ZqWNsQiRSaVWQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
Thread-Topic: [PATCH] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
Thread-Index: AQHcF/Q482rbLahQD0qhywmRaenDcbR3v1QAgAAFb4A=
Date: Thu, 28 Aug 2025 09:01:28 +0000
Message-ID: <a668a520-ad19-45d4-9de6-30f67f7c2a8b@epam.com>
References:
 <d7768394209c65cfef4006c3ffc0a0f5d82c4c18.1756368997.git.dmytro_prokopchuk1@epam.com>
 <72b403be-bfaf-497f-90c8-d1cc9ff84ce8@suse.com>
In-Reply-To: <72b403be-bfaf-497f-90c8-d1cc9ff84ce8@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI2PR03MB10668:EE_
x-ms-office365-filtering-correlation-id: a9d1e115-27b0-4ce1-f7e3-08dde61179b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V0t2dE9PY1Exc0dua3I1Y2Zobno1ZXFBRE43UkljcjlxVGg5NlNVcG5EbGk2?=
 =?utf-8?B?cW1sb0VvdHJFMFVyOEdoRGFkYUtta09JSnBWNWFBcU1Ba0R4a3g5c3hpcGgv?=
 =?utf-8?B?a3FNNkF6UWJRWEVnM0JuR2MwTWlFd3dXVjE2SmlVNHo0aGFsZStJbjBnOUtI?=
 =?utf-8?B?UEw3NlJRZ25DYlNMbFFJOVFuZ25yWGhDNm9ZVGJuQ3V4elZoMFhWajF3RFQy?=
 =?utf-8?B?YUF1ZSs0Q1ppV3Z5S2VDbzNWY2ZvUzFLcENTVG43amtzR1BMMzNsT2FkZEJq?=
 =?utf-8?B?bWQwdVVrTlNLRzZNZkdiVVdqRU5zTmU1RnFTTlhibnVubldOYTZ3R1V0Vm9v?=
 =?utf-8?B?dWpXL29UdFdMTTNkNDRlMXVrZFVLbmR5NzBlcjcxYUJDM1RHcFlUdWJ5VWhE?=
 =?utf-8?B?VTE1eUw4OE96MDF1RVNLMG1HSW5JQWZSNkw2NGVHdzlSL3JqanJJWUkyWTc5?=
 =?utf-8?B?SUEwUHVxeXRtbEI4RDI3YnlSS1BrOTRRcTdpbm1Gd2xHMWhLeWN4aS8yQkh5?=
 =?utf-8?B?akdRcWlZb3ZPQTFBQy9nVFd5OVhCMUR2eXNjYmZvemcyaHpoNnU5L1pyaUdz?=
 =?utf-8?B?bndheHZXam5UUHRUaTVPRHNUbFJJSTVCWW5DUXZBaGtPNUhNVmxNK0h0RWhN?=
 =?utf-8?B?QzZnQklSSEhTMy9ieUt3eW5sZVdBbDBMdC9ISk1YL0doeXF6RGNNUnord2U1?=
 =?utf-8?B?dGJwMWJ3QlJWVlM0VVZNZExGdEZaRlljY2xXeGV4L2tmTE4yYXdlN1dkeVJx?=
 =?utf-8?B?YUxVbFJsTitVYkswR1ZMbnBwSXhWYlhtYTBXUVl0QkZOUU44Q3M1eGh5Qk9T?=
 =?utf-8?B?NUhsUmp4RGdONkh3VFNYTWlkS08xVlRVLzF1UTZpT25XdGlRbWY5cGYyVjQy?=
 =?utf-8?B?QlloVWFjY1pPczM3NGZSQ1VIbHZqZEQzNHphQURXazA5U2NRSG1BSng3T05D?=
 =?utf-8?B?cFQzZ1R0akhWemgvaWJUdVpmUGx5QzhGZUFpZ2xTZXJxVS9ldFh2R2lnMy9F?=
 =?utf-8?B?clQrbDl3dVJtOFZqdFZqWE0wZmhJNEZRdk5DZXhhUjluOStDajg1K1RHeVk5?=
 =?utf-8?B?YXZ1MVVwTm9kUmpLVEpHZ1pCd0tuamV3MDFBTjB2RzAvNi9na3JKMTZGcHpa?=
 =?utf-8?B?dGFYTnZVTU1vbk12S3p3MWg0dW4xdnl0ZnVVMEpHb2kzYkt2NlR4RERpcFo4?=
 =?utf-8?B?Y1dGcGZDWENndUhtWGxCVFRKOFMwM3E3UjRMUG5nSDF2cCtYbUVEYWRRZmRX?=
 =?utf-8?B?S3FnaEFaUXE2MmNVSWloVFFQU2pOK3o5VE9sR2NzTCs2VDRNeGoyQkFUNHpY?=
 =?utf-8?B?TGJJNVFVQVRLa0RrY3ZoMUZZamh4TFhYc2h4VzJIUWpyWWlPSHBZaWRRVUVC?=
 =?utf-8?B?U1V2b1B1dmROTGtUdEMrUGtQbHBZMXZmWUJ3KyttODlPWVMyeWRnQmhJZHBW?=
 =?utf-8?B?S2RQVHFDSEpFemxuajZ1SlhuekVhL1JBaUlvdnJaekNZNFRTREd5RGw2T0Rs?=
 =?utf-8?B?eExEWnRKWWh5SFRiV3ZIdGFJV2FFUko3blVVdXcwU2djZWNwdm52K1NFUk44?=
 =?utf-8?B?ZlNUWUxQUHl3R0thc1p0RU5aSnJ2aDNyK2NXdWZCcUJJdWdQeHVjMzUwa0dp?=
 =?utf-8?B?UjJlcnJwTjh3dHNMWGRMWEpFRjIwem9OMmRlcEJYeVpERUFSa29MeldmZ0VO?=
 =?utf-8?B?VE0zWVVudHVzYy9SY1A4cU1FTHFxbkdSV3dqcEVyRDRqMHZ3OS9sSk9KQ3RU?=
 =?utf-8?B?MkJMR1VjL1B3V1RFVnhxRjhRZHgzUlV0ZHIvdnBseVZPSEFBNFByNnpnNEh2?=
 =?utf-8?B?R3hIanRQQXZlbDluNnpBUHhHaGdFV3RxMmppUFdBRWhaa2E0WTBWYVhhZElT?=
 =?utf-8?B?eUFWWjJvTHU4K0h2R2hmejZ4YmtGd1F5YTI1MHcvZkVSOXhUb2VLb3F4Z3V4?=
 =?utf-8?B?VjI4VmpSRi8rSmhqRkNFaStSaWxSL2VNNmQ4Q2U0REg5M3Y0eUczUW5IRUwx?=
 =?utf-8?B?ZVNxRjBEQ2dRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WHV1TlI3S0NZeFlVdkMxbmNtc3I1d3V2WUVxWUg3bDRJOXJNaFczRzhxb29W?=
 =?utf-8?B?WFk2RG9tNkdoT0YzNzlvWDluWFJzODBYSkE3K2pWVVN3R0tmUm1YQW14TER0?=
 =?utf-8?B?eXc2d0VwQzlCOGZoVTF6WVZSUzZrbThjZVdjb09USzkvZzFsYTRpSEoxMTFs?=
 =?utf-8?B?NlZwQ0FnQ25WSlk1QWRmS1loY3J2N0t0UEZOYlB0VE53NFhibDZKR0hqYkpF?=
 =?utf-8?B?QStxMGUzTmZXaWl6Vk5VeEJuY3pkU3kvSGlaVUw0MFBGNkR4cXUwWjlDNVJ5?=
 =?utf-8?B?a3AxU3FNekhtMitvbWhaTGJhSWhCcVRNL0hNRUdDWjBZdHRsWlFkVnJjYUNq?=
 =?utf-8?B?TXR4OTlUamhabkJSUDVYeWVYY1QzSGEvT2JoZFBBa3k4cEhiT0NIb0F6VFB6?=
 =?utf-8?B?UlVNckppNFJHMUt0eWt3cXdOaTlCNTRtZEpWeXZqRzRGUDl4TXZGMlkwOW9B?=
 =?utf-8?B?OE9ickw4NUoxSzg5MkdBNlYvcU51RG5XSnJ6bVRmYWxuZTB5TWFhZDd0alBD?=
 =?utf-8?B?Qld5UGdJYXpkTG5QQTFXMzB2ZDlGbzA1dnlBUXYwZnk0MXhyVEV4OTJIekZw?=
 =?utf-8?B?Y0V6aEpkd21mU09ndWg3RWpjbXhvMVlnckczczBEejdEYWtycDVPMkM0UjZl?=
 =?utf-8?B?dmN1cXlqSTgxVW4rMEZuSkw1S3hITTNUNTA5bG9VMzJFUGxQRkdhV1hSbFJG?=
 =?utf-8?B?dDhzNU0yS0UrRkZ4R1RNVVlkR0FVeitlOTJtd1RpMzhYOEovQlRFZFk2SDBO?=
 =?utf-8?B?MU82VWtqZE5oSmZTR1VsajdFQTR6Y2dTNUQ5bkRjMm54Y2JyekZucjBJVnJC?=
 =?utf-8?B?eWw2U2d6VU5sQ2wyVmd3Vy96b2RMckFNQ1Z0OHVvZ01OcXR2QU1yWi9EMTcv?=
 =?utf-8?B?MDJrb3hkdnY4VytEckkzRzd6Zi9QVktTcytMaXJMMkViQjVtckJzc0xFWXVv?=
 =?utf-8?B?alhscXBwSG9nRzhNKzdkZUJwK2VkZC91RWhVZlc3Tk1pOERZQ29QTGtmcS8v?=
 =?utf-8?B?eUE5MWp2Skx4WDFaREpsamY3eFpjbkxTQzdzRmF5RHpWQnAyeitjUTAvNXMz?=
 =?utf-8?B?bTZhUVNNdWp2cHpuRXArUS9LaG96ZHNqWHFraGJRMjB6NnBrT1crWGVYVGtU?=
 =?utf-8?B?aEdZcFVva09LZ1U2QVlobGNTbENUcU9DdmpWNG5WWUsyalNselNmS212MXM1?=
 =?utf-8?B?akYyV3hOYlN6bGhNWFFHRlBOZnZwVitmSXIvN2FRcWgwbWlaUFBOUnl3Y3Nx?=
 =?utf-8?B?ZHlxU3hXZ2h2Y0JtdEJkTkwzQzJQcWprZHdMSVVqZDFyYmtENVFYa1VZOFNr?=
 =?utf-8?B?WXhQY2JlSVBVQnhsTUd6WCtoZXIvTmpFQUswNUFzRm0zSWJJbzZFSHpES1g5?=
 =?utf-8?B?ZFR2eUx0Zit1M2REcVJBRkZVQ3JFRG5BTFJBTFArSVlBUjdxWE04MWFBdHRa?=
 =?utf-8?B?SjkvSHc2WmY2U3RsRDQwMmU5SFhVbTdGVWhQeG5MZUxiTXBLdVU5NWg0UURx?=
 =?utf-8?B?WW9Zb0E5MTdjcjRJeXo4TUp3SmdsaWdGK2ZLRVVLVnUya1JGQ1dXS29pUHVF?=
 =?utf-8?B?R3hVL0k2RlUyRmRqSzNFaVBYZWo4RGVtRG55VXhVZmpDODBMclhxcEwySllV?=
 =?utf-8?B?TTUrcmVlZnQ2WjNUT0M4ZHJoOXZsa3pyUEtyc3lzcUlKbnhwSFN2Q09NZm93?=
 =?utf-8?B?amZpS2g3dEwxL2ROa2xZajVaOCtaRWJETlA2K2hNQ1lCdXR5TDR5a09nbE84?=
 =?utf-8?B?WHp6eS9kZTdKK29LVGMxZzg0SVJXN01rdDJ1bGx1Q08zbW43aUpobDFhRS9X?=
 =?utf-8?B?Slg0RW1DTmsrS0FwWkJMVDNxT2lFQ1NBMVFuL2MvZ284UVB2cFlISjBsczhl?=
 =?utf-8?B?Z2pNWVc3NHdTaTY4d1U0cnRMZC9HTWJzWXNJODI2RENWd0ZrdGo3RG5OWEti?=
 =?utf-8?B?WDJQTkM4Rjdna0tibU5GaG81OVk3bzF1cnhDOStGOWhLZWJxRFJkOUFaVklZ?=
 =?utf-8?B?UzJrd2p0K0RuREZZTWUyUFBweUo4U3BibTU4czBPdVhIZ0FWUXR0eUF4U01t?=
 =?utf-8?B?NHZvdGxHQzRSeTFBMFRlMFhTcFRham9NdnZyWmFRNXpDM3JvK3pBVEhFbHdw?=
 =?utf-8?B?L1ptV25aMWVxRS9YclF1Yk5pTnlEWVhBYWVmeGEzajlIdXlmSVU2MUxjdkYz?=
 =?utf-8?B?VUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB43CACBC1ACC74FB7BA6D937F610039@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d1e115-27b0-4ce1-f7e3-08dde61179b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 09:01:28.6346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EcdxCrhGanGSkiduJftvYaOuVAvlCvjVwgXvaVVSkHgSzRRav5Uo+nYmV6NwHqpTdWBtFImQv+/iRF7axHvm49tZ41oB18xLRbhaRiyRo6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10668

DQoNCk9uIDgvMjgvMjUgMTE6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4wOC4yMDI1
IDEwOjE3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBSZXNvbHZlIGluZmluaXRlIGxv
b3AgaXNzdWUgaW4gdGhlICdmYWlsOicgY2xlYW51cCBwYXRoIG9mIHRoZSBmdW5jdGlvbg0KPj4g
J2Fzc2lnbl9zaGFyZWRfbWVtb3J5KCknLiBUaGUgaXNzdWUgd2FzIGNhdXNlZCBieSBhbiAndW5z
aWduZWQgbG9uZycgdHlwZQ0KPj4gZm9yIHRoZSBsb29wIGNvdW50ZXIgJ2knLCB3aGljaCBjb3Vs
ZCB1bmRlcmZsb3cgYW5kIHdyYXAgYXJvdW5kLCB2aW9sYXRpbmcNCj4+IHRlcm1pbmF0aW9uIGNv
bmRpdGlvbnMuDQo+PiBDaGFuZ2UgJ2knIHRvIGEgc2lnbmVkIGRhdGEgdHlwZSAoJ2xvbmcnKSB0
byBlbnN1cmUgc2FmZSB0ZXJtaW5hdGlvbiBvZg0KPj4gdGhlICd3aGlsZSAoLS1pID49IDApJyBs
b29wLg0KPiANCj4gSWYgSSB3YXMgYSBtYWludGFpbmVyIG9mIHRoaXMgY29kZSwgSSB3b3VsZCBz
dHJvbmdseSBvYmplY3QgdG8gc3VjaCBhIGNoYW5nZS4NCj4gQSBzaWduZWQgdHlwZSB2YXJpYWJs
ZSB1c2VkIGFzIChlZmZlY3RpdmVseSkgYW4gYXJyYXkgaW5kZXggaXMgYWxtb3N0IGFsd2F5cw0K
PiBjb25jZXB0dWFsbHkgd3JvbmcuIFBsdXMgaSBjb250aW51ZXMgdG8gYmUgY29tcGFyZWQgdG8g
bnJfcGFnZXMsIHdoaWNoIHN0aWxsDQo+IGlzIG9mIGFuIHVuc2lnbmVkIHR5cGUuDQo+IA0KPiBX
aGF0IGltbyB3YW50cyBjaGFuZ2luZyBpbnN0ZWFkIGlzIHRoZSB1c2Ugb2YgdGhlIHZhcmlhYmxl
Og0KPiANCj4gICBmYWlsOg0KPiAgICAgIHdoaWxlICggaS0tID4gMCApDQo+ICAgICAgICAgIHB1
dF9wYWdlX25yKHBhZ2UgKyBpLCBucl9ib3Jyb3dlcnMpOw0KPiANCj4gb3IgeWV0IG1vcmUgc2lt
cGx5DQo+IA0KPiAgIGZhaWw6DQo+ICAgICAgd2hpbGUgKCBpLS0gKQ0KPiAgICAgICAgICBwdXRf
cGFnZV9ucihwYWdlICsgaSwgbnJfYm9ycm93ZXJzKTsNCj4gDQo+IFNlZSBlLmcuIHByZXBhcmVf
c3RhdGljbWVtX3BhZ2VzKCkgZm9yIGEgc2ltaWxhciBjYXNlLg0KPiANCj4gSmFuDQoNCkkgaGFk
IHRoZSBzdWNoIHRob3VnaHQuLi4NClRoYW5rcyBmb3IgYWR2aWNlLiBJIHdpbGwgY2hhbmdlIGl0
Lg0KDQpEbXl0cm8u

