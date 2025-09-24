Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4041B9ABB2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 17:40:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129508.1469435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1RaY-0001Pb-Ph; Wed, 24 Sep 2025 15:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129508.1469435; Wed, 24 Sep 2025 15:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1RaY-0001NA-N2; Wed, 24 Sep 2025 15:39:26 +0000
Received: by outflank-mailman (input) for mailman id 1129508;
 Wed, 24 Sep 2025 15:39:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uXxj=4D=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v1RaY-0001N4-62
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 15:39:26 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a55ea08d-995c-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 17:39:24 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7074.eurprd03.prod.outlook.com (2603:10a6:20b:2dc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 15:39:21 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 15:39:19 +0000
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
X-Inumbo-ID: a55ea08d-995c-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4g1WMmtwAIW9U2QGGXnq0tMGRacrf+ISrlqLjiq/q64FhFsS/X3kmkOD2nWF0WG05eu9IjJxt7/z7NyCeh8Z8yMZXWJT9d0pawl5jVL+KYs0kal0gvMqXh/0/jyMihdF3xihYPuDAMUYvadC6EC/ikpFquf1zmrSNpoE8W6sSeWjX0hwuHJV54CvYh9JV8qwF4mZHCSKH9C1q1Mp5ZO5hPdOWtiYsWl/lz8dDY3HmpEN+LqNkhCnogWNP6tiMN+PiFvQaM1+VwcU4EECKUMO9MsQt8DykvFsMg4peBSE8Ts55bF+cm8i7GtS1tJMBLDZiJmVgBo+KgckmGCTK5HqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4Z9+LUwwUfJH4SrNkv1fo7udWuHs5t2KQpnN/guLrA=;
 b=xIXIIUhayAbWbiOzIkwkadKSMV+YSUSRFOzFRbfoLpy5XLhY8z94zJdiZ+DTlI9can3V8UCxsblkqGtZCpCa5vZ03JknW7n35rr0eD0OKJh6alWZBTIThc3+oowFxXA/V8TDJvbhsdY4cLzaMIjc1Cfs1o7SClrBzULXr74tGsOsbkk8I+UvBt7iOklDddvtWLQtZaHmr6gDDGTWkTQCKzXO/bi+XGj4t6I26IVL7cZN5JQTgmGhg0SlewqghW0OpVC3LUtSzYDjRI0t6UwAbr7TlEz3MtlDnlqtvkD10jcGZw3mpMdXcHHjzazl5I51mUm36xn8jlEOsyq02O5u8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4Z9+LUwwUfJH4SrNkv1fo7udWuHs5t2KQpnN/guLrA=;
 b=LHjqoRzt5SlobxPRICWxv+lCEDW762cMavpSEiweutSgXcjRW4rngjrNXaTpHqMpMf4fm5QG/ThzLSA2Uo8PMsg7MiHbiPI8xDHrCretrNmT54RvnHOcwfTzsX+g5kR+vNhn8zXCfocKjYmMGSqAvMb0L2XgOarL5MXwuRHvIlzrCZQ+Bs5f6SqAHEi7jdnwn0C6DKJkRc/nZLcumOj3iwaAC2VQ4/Z8jKfmXZcvsdTC0IOdG9vgTlN+KzPKbG3ExunD9QS/asFjwFud0uxRlBkpKM7u+SSoW0TvlSzALv5exdCzM72YzUAexMuVKLwg78UhU75yz+U2UUL9EaIXsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <691c8b06-b30a-4d2c-b371-fc4f47bf431d@epam.com>
Date: Wed, 24 Sep 2025 18:39:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <aKiBJeqsYx_4Top5@mail-itl> <aKiBwEsogK420kwo@mail-itl>
 <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com> <aKi6Foj-Lx_n0L6l@mail-itl>
 <aNEgTgis2JeyQ4HA@mail-itl> <8f6b8f08-ca62-467b-a6be-4d33208e5393@epam.com>
 <aNPyW5a7BHni-SuI@mail-itl>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <aNPyW5a7BHni-SuI@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM9PR03MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a3eaf4-3dea-4f4b-679b-08ddfb808683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2lBVURpRGRaaWJROWVhTjBQS01JTGZTMjNaMGlpenVXNXZCY09XMHNuQm82?=
 =?utf-8?B?Q2E5TWFEZjl0VER6NzBQbHFQMDNZaVROZytqb0pJZCtiS3Bod0JZT0p4ck93?=
 =?utf-8?B?SjliQW5WWSs1a1JaZ2Nxc2NseWJrWUZaMFJKMnBIY2w5NU5uNGFka1FyOVMy?=
 =?utf-8?B?azJnU090TklCenJmWjBHbjBLZUFaWk44QlNQSnFjR09UbDZIVHhXYW81MW5h?=
 =?utf-8?B?MnovOWdkYzd1TXgyWjIrWkVYZTBSRzV2VXRXdjJWN1ZBeXYwTTZibitSZk40?=
 =?utf-8?B?a2FVN1cyTG95RDk0amFFUm1XMk5uQm5KNXdGRE5UU2ovZXI4WjR4Q2NodXR2?=
 =?utf-8?B?UTRJUVRtWnp4SS96aXIrSFpRdnlxUktRSXdDeFJZbnl0RU1mcWw2b2RTSE9a?=
 =?utf-8?B?bDJ5K0pKTWowb1gxdlNBY1pDaFN4SU5LN1dYaU9oOHhSbTJmRHpmc051WlNT?=
 =?utf-8?B?SjdXNWQ3SW41NHJ0RGJ6Q0JBSFV5SlorMDkzLytYRythWUFVVzBwVGFlWW9z?=
 =?utf-8?B?VW9xR0J3V1ZEYXY3NkUydWZoUW8rc0I1T0dGMGJlUE1MWGFWNDFIWG1seUJE?=
 =?utf-8?B?WEY1S3lKOFU5UGVFbXI1MDRyWktsZjd6TCtlS1czaHNuaS94SlFEbjhWVWZo?=
 =?utf-8?B?R2h3b2RKbVB6NFpKNXY5THJ3N1ZKcGc2cTgxYnY4T3lOVERkTlBWOHFiNENs?=
 =?utf-8?B?TVVWS0FPMGRBN2Vob3Q4djdoRmhLNDUxSXI0RWV0SUhTcWZMc0E2dXBBcnJl?=
 =?utf-8?B?K3hIR3UwQzQ4Z1BjTnA5WVZZcmE1NS9zN2xuc1ZiczBsRk0ybUZOSW5iRThw?=
 =?utf-8?B?cVNQdEJucitnRE1EVHFHdW1tRHVjUHdBT2MzTVdqRUZNaVU2aWxlZk1kQjc2?=
 =?utf-8?B?NVNoelZZOXE1WWtMTFk5MDFFR3I1cTNXZlBjeVRHUXJCMG50NkVNV2tITGJG?=
 =?utf-8?B?VHQ0OUdWUUU0aFlxUkZwV2dMWHN1Q3hORWRoRkpEa2Z1YURzb3dYcVhENXRm?=
 =?utf-8?B?TDNGSWpyVGxqY2pzcEFqMFlRRjhhTkVnQy9vTzdIWG5hZzNHV0Z5OWVseDFo?=
 =?utf-8?B?SVlpblJZNHBSMDdrSDdoNzhDbXYvRUoxSWIxcGlPQ1BnRXNHbFJNRDFqWS94?=
 =?utf-8?B?cHR3YWp4Rmc1bi91cGRwSG5PS01TcTVYdmxlNU5XSFlsQkJ4by9JT3pnWkJ2?=
 =?utf-8?B?L096MGJ4cS92MkJBSEpvUThMUHhUODRBUE1SQUhpWU8yN096OFB2aUhVU28w?=
 =?utf-8?B?SGRBdDZVTjlHK0hMeG1BSHRSYlJHSUFRZnNXaVVaZUQ2R1pEbmFDZ3Z4b0Ro?=
 =?utf-8?B?aUF0NGUxZFpEbUphb1pwNU5FVjRXdFlnaFl2aEtQYXpOeG9wNHQ0aHJqT1V1?=
 =?utf-8?B?eTMyenE4cnRiekt0eFR5S1NLRXFnYTlaSFpYaDRyY3dONUpHMmVOSGF4S3lD?=
 =?utf-8?B?dFNTVnVyUDJ4TnJSOWdjM1hVazJoTEJMRWdRUmFqaWRLNjlidFRaREdIOE5P?=
 =?utf-8?B?VVZKMDl2VGY1b1dTMVFaVW1CUStCYjdQVFoyeEV1cmJIcVlRQlBnN2MzV2M2?=
 =?utf-8?B?THF2dUxTTHQ0ZFk1Z094MmZJSVAxSENTUXNHNG83Mi9Rb1RIMEROTjE2d1hl?=
 =?utf-8?B?dGx6TEIyT0hvbWRTMGE4MmIvTUFWaHFXdHFOWnJtSUc5RlpwcXorM2xscnpi?=
 =?utf-8?B?QVN2YjJSTFpHKzR4UUpJS2FGL3RweXU4YldBTkdjL09jT0N3ZklqcmhsZTFs?=
 =?utf-8?B?TDRtOUp2aXU5d1k0V1lwdFVNbldlSklTSGhLZFc4cUZjYXdxYlIxazNjZ1dK?=
 =?utf-8?B?bCtWQUViS2ZlM2N5cDFINzFYMDUzWThJNXRrY3A4cjRKZUdBcjhtVVZDNVFI?=
 =?utf-8?B?Q0xRcnhWRC9oWitLVHVLYlJTdVZkQzRYK29DQkxTRUsxNncxT3VjVlczaTk5?=
 =?utf-8?Q?RNTPmPQYUIw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzAzTU1hRERJZDFwQ0R1UUVhY0lBZ2RhazZvNWp2ZVYzRXozZURFdnNSeEc0?=
 =?utf-8?B?YzZONENhb0NUbCtkS0hhUEZzWGVEZm8rUWZMczVCMmhkR28zR3FhYkZrQTlm?=
 =?utf-8?B?RTZTT3I0SkZVU1pVRG82dGpPTklxd1FMUk01REl5bDNsRkVRazdwL3lsb09q?=
 =?utf-8?B?Zk1Cb1ZtOFBsN3dxV0RmdTZFV1NVd2x0bzl5QWg2K1V0MFRZM2FRdjNjd3Zm?=
 =?utf-8?B?aVNabzVJTkpWemRHanhSTDRyTlA5YWhyODZZOGg5L1p1cG53MTlRZmdGZlli?=
 =?utf-8?B?cU1VdERNYUs1VFV1TVU1dWw1WEZNRWZsaWF6OUtTUDZkSmx2N20wNmhHbmFG?=
 =?utf-8?B?dW13QXRiNGx2MWtRS1hKTkVjQzhxSW5aZG00N0pkN0EwTmxpTkJVN0NrSk45?=
 =?utf-8?B?QWsraUxma2g3WnAwVVVRcnRkdkwxMmRXblBsTGVlVDRBZ0R4Z0g0dTJhOExh?=
 =?utf-8?B?bWdHRmcwc2w1RnF3YUdvUGkwZ1FvcFViQTkzcDFwNW4rWHhmcTJZNVo0eXkw?=
 =?utf-8?B?N3FKWXhyb2RoZFRlNG00OHl4a3JTUHpHWHltNWNIaXRtT29tOEVDeFZzWGh5?=
 =?utf-8?B?ZmJqS3RuYjZHWW1XSXI5MjQ0R3dMSWNiczZaVVAxUGxjOGJCWFFZLzI2dTVU?=
 =?utf-8?B?OThQc3ZDdGdxTTN0SW85S3VpbUsxM3pCMVgzV012OHZZZ0tsTmc2VFhkb2N2?=
 =?utf-8?B?TjVGUjJIWjgrOHZWTktsNVp3ZThTZGxVRVJZZGg2Wkt6dXFmOExNaDhwbE1V?=
 =?utf-8?B?eUI0Y3pQd0V5cWlaU1BDRVRGU1JFNUtBWTVYWm5SSWlwb1dWaXROVENVMzNG?=
 =?utf-8?B?Sms1OE01bVYzMVh5M2lnZjZtd0ZaWG1FN1ZEcUtBNUlaRUNxVmc2UGVxYWJt?=
 =?utf-8?B?OUgvSlVibllCeUhBdVB6aTRaaDRvQkl2bEwrbHM5akUrUTI2UHZJSmFwTlZ3?=
 =?utf-8?B?bStxRzRERk9sQ0hIUFUvQUZseE9SeTlRc3Z5SXJ0ZFh1WjEzSkN1TnhNcWZp?=
 =?utf-8?B?R2VyeWxkSXhQMkozNUhKUnR0dWNjbTZzSFlDMStTeWxBb2pRaWJXb3BsZkF0?=
 =?utf-8?B?THNSVWtLYVNhODgraURybjk2RWFtUDFPMkdLcE81UHdRaThvRWZHb05FSEZP?=
 =?utf-8?B?QUlVWlZVSzhNZzFRaDRPWlNSTmx6c1IwVm8vTU5FNGQwNmloRGdTUnk5Z3BK?=
 =?utf-8?B?bUM2S2plY3FGUWFHMzlZdWVHcUxYa1VpZHVFUXZTb1dJNCsyQ3o2OE9KTlpQ?=
 =?utf-8?B?TkVRUS9WKzkwYUhxcDArQ2dneFJ5WEE5eUhaaE50ZHY3aitYOVdmTXhoQWR1?=
 =?utf-8?B?ZVRvMEdIaWVKUW5tZkhzazNZdThWaDBIaUhkOW5tOWVDd1B5ZitMallCNjM5?=
 =?utf-8?B?YWg3b3BNWHpHSjg5STFsRnJPc29RUGlrbU9Yb1docWRUMjlvQVZVaEdXL1k5?=
 =?utf-8?B?WXc1ZkdEZEdLK0kwREhZbGtwNGQzRnJmZHcwdEs3eTR1NTh4NkY2YmRTa252?=
 =?utf-8?B?UlZRaENGWllvVnEvbmR0bVhuZStQS0hGc1poTmJ6T1FuZnExTndSOGZhNTVa?=
 =?utf-8?B?N1RpK3U1SEhTTTBMeWtWd0dyUGw0dms3ZzVSQUlUWU9ObnVja3FSakMwR3lH?=
 =?utf-8?B?aFBndGFjb0wyZWltKzd6V3ZPMmo3WWc0UWtRN1JIREF5dTNoMWxCVVc4d2pX?=
 =?utf-8?B?eUZaZ1ExclBiL0p6V0lPTks5K0hvVTYzTVlWaXpWMzBjMVU2TnNaNnZ2QWor?=
 =?utf-8?B?VUNaVVNTTnFkMmo5TXA2RzRXSUZHdVJZTWF2eWt2cVlQMXVTeFhoT01nbHNQ?=
 =?utf-8?B?UFg5Ymk2Zk5xM1ZNN1VoZzVMeWlZVWlpUkllUEV1Myt3WUVWb1B0am0vUzho?=
 =?utf-8?B?a3p0R3FFbkUrWlJBOWxiY3c4RlNPUnZZaXpyQjl0NWg3cGpqMFIvaklkbHFS?=
 =?utf-8?B?OUpzM0JlaHQ4czhabkFWWUhJYjdaRndEV2dJTXZsR0NrSzZwVmZ0bVZQTGJw?=
 =?utf-8?B?cGJ0NHJaRFZYa0Z0ZTl1WTg4M1JlSDVTQ05HUFVxRi80Mmx5Z1JhaHA3enQz?=
 =?utf-8?B?SHFIYXZsZk5GRkJzZEk0aWt4azBDbUp4Q0d5UjhKWGZjZDJPelFwYUR2alRy?=
 =?utf-8?B?MW41cDh1N25RNjJEU2ZncU9pZVZnQkJ6aFVrWDZvV1RkV3M1bmplTjdwenJk?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a3eaf4-3dea-4f4b-679b-08ddfb808683
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 15:39:18.9111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5KxIL1+Vehce5Aa9kMsPvb8gYe9g10jsrrB79tUUpssqXxikzRGZSynCvBkhvuTkeJdK4IdDP6b/3IwTu+CRHAP43XgAt+B9aqOiywwNh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7074



On 24.09.25 16:30, Marek Marczykowski-Górecki wrote:
> On Wed, Sep 24, 2025 at 01:17:15PM +0300, Grygorii Strashko wrote:
>>
>>
>> On 22.09.25 13:09, Marek Marczykowski-Górecki wrote:
>>> On Fri, Aug 22, 2025 at 08:42:30PM +0200, Marek Marczykowski-Górecki wrote:
>>>> On Fri, Aug 22, 2025 at 05:27:20PM +0200, Jürgen Groß wrote:
>>>>> On 22.08.25 16:42, Marek Marczykowski-Górecki wrote:
>>>>>> On Fri, Aug 22, 2025 at 04:39:33PM +0200, Marek Marczykowski-Górecki wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> When suspending domU I get the following issue:
>>>>>>>
>>>>>>>        Freezing user space processes
>>>>>>>        Freezing user space processes failed after 20.004 seconds (1 tasks refusing to freeze, wq_busy=0):
>>>>>>>        task:xl              state:D stack:0     pid:466   tgid:466   ppid:1      task_flags:0x400040 flags:0x00004006
>>>>>>>        Call Trace:
>>>>>>>         <TASK>
>>>>>>>         __schedule+0x2f3/0x780
>>>>>>>         schedule+0x27/0x80
>>>>>>>         schedule_preempt_disabled+0x15/0x30
>>>>>>>         __mutex_lock.constprop.0+0x49f/0x880
>>>>>>>         unregister_xenbus_watch+0x216/0x230
>>>>>>>         xenbus_write_watch+0xb9/0x220
>>>>>>>         xenbus_file_write+0x131/0x1b0
>>>>>>>         vfs_writev+0x26c/0x3d0
>>>>>>>         ? do_writev+0xeb/0x110
>>>>>>>         do_writev+0xeb/0x110
>>>>>>>         do_syscall_64+0x84/0x2c0
>>>>>>>         ? do_syscall_64+0x200/0x2c0
>>>>>>>         ? generic_handle_irq+0x3f/0x60
>>>>>>>         ? syscall_exit_work+0x108/0x140
>>>>>>>         ? do_syscall_64+0x200/0x2c0
>>>>>>>         ? __irq_exit_rcu+0x4c/0xe0
>>>>>>>         entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>>>>>        RIP: 0033:0x79b618138642
>>>>>>>        RSP: 002b:00007fff9a192fc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
>>>>>>>        RAX: ffffffffffffffda RBX: 00000000024fd490 RCX: 000079b618138642
>>>>>>>        RDX: 0000000000000003 RSI: 00007fff9a193120 RDI: 0000000000000014
>>>>>>>        RBP: 00007fff9a193000 R08: 0000000000000000 R09: 0000000000000000
>>>>>>>        R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000014
>>>>>>>        R13: 00007fff9a193120 R14: 0000000000000003 R15: 0000000000000000
>>>>>>>         </TASK>
>>>>>>>        OOM killer enabled.
>>>>>>>        Restarting tasks: Starting
>>>>>>>        Restarting tasks: Done
>>>>>>>        xen:manage: do_suspend: freeze processes failed -16
>>>>>>>
>>>>>>> The process in question is `xl devd` daemon. It's a domU serving a
>>>>>>> xenvif backend.
>>>>>>>
>>>>>>> I noticed it on 6.16.1, but looking at earlier test logs I see it with
>>>>>>> 6.16-rc6 already (but interestingly, not 6.16-rc2 yet? feels weird given
>>>>>>> seemingly no relevant changes between rc2 and rc6).
>>>>>>
>>>>>> I forgot to include link for (a little) more details:
>>>>>> https://github.com/QubesOS/qubes-linux-kernel/pull/1157
>>>>>>
>>>>>> Especially, there is another call trace with panic_on_warn enabled -
>>>>>> slightly different, but looks related.
>>>>>>
>>>>>
>>>>> I'm pretty sure the PV variant for suspending is just wrong: it is calling
>>>>> dpm_suspend_start() from do_suspend() without taking the required
>>>>> system_transition_mutex, resulting in the WARN() in pm_restrict_gfp_mask().
>>>>>
>>>>> It might be as easy as just adding the mutex() call to do_suspend(), but I'm
>>>>> really not sure that will be a proper fix.
>>>>
>>>> Hm, this might explain the second call trace, but not the freeze failure
>>>> quoted here above, I think?
>>>
>>> While the patch I sent appears to fix this particular issue, it made me
>>> wonder: is there any fundamental reason why do_suspend() is not using
>>> pm_suspend() and register Xen-specific actions via platform_suspend_ops
>>> (and maybe syscore_ops)? From a brief look at the code, it should
>>> theoretically be possible, and should avoid issues like this.
>>>
>>> I tried to do a quick&dirty attempt at that[1], and it failed (panic). I
>>> surely made several mistakes there (and also left a ton of todo
>>> comments). But before spending any more time at that, I'd like to ask
>>> if this is a viable option at all.
>>
>> I think it might, but be careful with this, because there are two "System Low power" paths in Linux
>> 1) Suspend2RAM and Co
>> 2) Hybernation
>>
>> While "Suspend2RAM and Co" path is relatively straight forward and expected to be always
>> started through pm_suspend(). In general, it's expected to happen
>>   - from sysfs (User space)
>>   - from autosuspend (wakelocks).
>>
>> the "hibernation" path is more complicated:(
>> - Genuine Linux hybernation hibernate()/hibernate_quiet_exec()
> 
> IIUC hibernation is very different as it puts Linux in charge of dumping
> all the state to the disk. In case of Xen, the primary use case for
> suspend is preparing VM for Xen toolstack serializing its state to disk
> (or migrating to another host).
> Additionally, VM suspend may be used as preparation for host suspend
> (this is what I actually do here). This is especially relevant if the VM
> has some PCI passthrough - to properly suspend (and resume) devices
> across host suspend.
> 
>> I'm not sure what path Xen originally implemented :( It seems like "suspend2RAM",
>> but, at the same time "hybernation" specific staff is used, like PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE.
>> As result, Linux suspend/hybernation code moves forward while Xen stays behind and unsync.
> 
> Yeah, I think it's supposed to be suspend2RAM. TBH the
> PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE confuses me too and Qubes OS has a
> patch[2] to switch it to PMSG_SUSPEND/PMSG_RESUME.
> 
>> So it sounds reasonable to avoid custom implementation, but may be not easy :(
>>
>> Suspending Xen features can be split between suspend stages, but
>> not sure if platform_suspend_ops can be used.
>>
>> Generic suspend stages list
>> - freeze
>> - prepare
>> - suspend
>> - suspend_late
>> - suspend_noirq (SPIs disabled, except wakeups)
>>    [most of Xen specific staff has to be suspended at this point]
>> - disable_secondary_cpus
>> - arch disable IRQ (from this point no IRQs allowed, no timers, no scheduling)
>> - syscore_suspend
>>    [rest here]
>> - platform->enter() (suspended)
>>
>> You can't just overwrite platform_suspend_ops, because ARM64 is expected to enter
>> suspend through PSCI FW interface:
>> drivers/firmware/psci/psci.c
>>   static const struct platform_suspend_ops psci_suspend_ops = {
> 
> Does this apply to a VM on ARM64 too? At least on x86, the VM is
> supposed to make a hypercall to tell Xen it suspended (the hypercall
> will return only on resume).

On ARM64 Guest expected to trigger PSCI(SYSTEM_SUSPEND) (which is HVC - trap, similar to hypercall on x86)
PSCI is Arm Power State Coordination Interface which defines unified FW interface for PM.
So if you overwrite platform_suspend_ops (which is Singleton) it will break ARM Guest suspend.

> 
>> As an option, some Xen components could be converted to use syscore_ops (but not xenstore),
>> and some might need to use DD(dev_pm_ops).
>>
>>>
>>> [1] https://github.com/marmarek/linux/commit/47cfdb991c85566c9c333570511e67bf477a5da6
>>
>> -- 
>> Best regards,
>> -grygorii
>>
> 
> [2] https://github.com/QubesOS/qubes-linux-kernel/blob/main/xen-pm-use-suspend.patch
> 

-- 
Best regards,
-grygorii


