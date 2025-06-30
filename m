Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD676AEDC1F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 13:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029087.1402826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWD8N-0003hX-MO; Mon, 30 Jun 2025 11:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029087.1402826; Mon, 30 Jun 2025 11:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWD8N-0003gL-JL; Mon, 30 Jun 2025 11:57:15 +0000
Received: by outflank-mailman (input) for mailman id 1029087;
 Mon, 30 Jun 2025 11:57:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRFK=ZN=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uWD8M-0003gF-MD
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 11:57:14 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c4cc2a6-55a9-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 13:57:13 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DB9PR03MB9638.eurprd03.prod.outlook.com (2603:10a6:10:458::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 11:57:10 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 11:57:10 +0000
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
X-Inumbo-ID: 5c4cc2a6-55a9-11f0-a312-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAEHM5P8U4Q+5v8h7eHNJl1xyo3/06ftH0oynuD2fQfew17REJ3f5Dpv3OfPm+tcK8RO99NuF9WkED2b6W95BMgDyN/aSfE133irnHfpYFZYfi9+WTSyJ+CK2SPUVsp+pQ98eP6sTT4rqKieoNIMkoDm7rWjxw2f3j27famQGoghGRn47FnE2xw6oozaxxiIRVAzI7qNwWm/okBO+v+VEd6t9i3LgB/LHHjNVeHmjrjOLcCQso0zKhgoUCvyO/FYjYt6jUI7MEsxKs8CRpsS4T9ciI3C2LOef76HEqK3xhMmIDZPZ33U3WjHNOn/4j4/e2K5nrhZOhnQhvxv/X75HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiXCFbfbSkJXhwT6a/rOMtUdu6laUsAoPsL1b+sE1tE=;
 b=bMtn9/IZqiODbmCD3vbDrG6oQH2gcQMB6o6s3baPuHVpflvqQANPtZFljow8/F8IGh7ar3dEeD65pKvCQRDmCrxb40apOnu03MUISsXPq0sGPrVGF86jVRvJ+hituJ0bb3AhBa7UCl/T0RiPoQQ4udpLexwulOHCecky9sU7Q94k1SY9FQQvFbuBpMIqYuL30mDokccIxRvkys5wNnH3REMVykwqrLCR60A4oSQ+QmCtggEyv97eBOoaYSMtudVTo9a7Vzz74zGGZhfhGolPZ8rF3nrghp0azJxn54oGylfwXPSPTNDnUSqcXQpnA57AfFdPQzdz9y8iWbwwpxoYuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiXCFbfbSkJXhwT6a/rOMtUdu6laUsAoPsL1b+sE1tE=;
 b=gZUIJFJhdvZozXHqbsO8p0iqMCX8dPXCnvbHqdnl+Q0u3URDwm4e/GiStiBNa0QnFUsv/Js2ZJdYoPAABqPLRIG2Vn5QE7KXrgFsJVdCrY+Yokx8jKFyAQVCiT/9kFBNq/DxPA/7hru0kOVMFsbpjOHk8cYNBkgN5m4tKigUUE1NYLl101KOmxOvQSe865CepqM7thWiBEkxf1yDXLqXnxLxDMvQffgsHEk/DjXbbs74amf3Hr0rA3ONOAXyVF5cEV9PDHGRk/Gx0yC1sZ0mm+BNHAAKRt1XaW5ArYhwMMTi+WS22Htd1ZTUmjSTKOVyCzkZoGcJ8vrwURd00qkiNA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v4 8/8] docs: armproposa: l to add separate SCMI node
 for Xen agent
Thread-Topic: [RFC PATCH v4 8/8] docs: armproposa: l to add separate SCMI node
 for Xen agent
Thread-Index:
 AQHb4TVhOpwmaSC7dkC7oLLOKyrberQPvwGAgACpCACAA+mNgIAADJ6AgAX31oCAADB+gIABI0OA
Date: Mon, 30 Jun 2025 11:57:10 +0000
Message-ID: <6689b22a-f85e-40ba-a89b-7935df1bdd28@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <3f7e1e99f5d1018064f3c4825aff16bd487cf558.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231309090.147219@ubuntu-linux-20-04-desktop>
 <e5e8b7b3-a9c3-4e1a-9241-6776990b6e11@epam.com>
 <alpine.DEB.2.22.394.2506171720390.1780597@ubuntu-linux-20-04-desktop>
 <e4bf11e1-5bf5-4428-bd73-4fd2cb2029fb@epam.com>
 <alpine.DEB.2.22.394.2506221451440.8066@ubuntu-linux-20-04-desktop>
 <3468bb57-3178-460b-8fb2-3ce106475319@xen.org>
 <df2ee229-ec98-4097-a6bb-b16910c540e9@epam.com>
 <c8521929-50dd-4113-bb35-1d64e3a0645c@xen.org>
 <d92874cc-e8f3-46d3-815d-1c21c42dc96b@epam.com>
 <41566d23-464b-4676-8e01-e2f27d377a94@xen.org>
In-Reply-To: <41566d23-464b-4676-8e01-e2f27d377a94@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DB9PR03MB9638:EE_
x-ms-office365-filtering-correlation-id: 4873f65e-2721-4ee3-af90-08ddb7cd3eb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V1AvRmZyNEZBOWN0TDZGZGZiZ0YyUkw2MTNQNjNkTysySUdrby80S2dPREha?=
 =?utf-8?B?ZHorZ2NDK1BWK1hvNFRqR3M5M3krY1hTczU1SzhZNjk3M2ZLaTU5OUVmdXJY?=
 =?utf-8?B?N3ZQaW9kdHdTYktCK0tteHRmUWMwR1JVTmhBeGxiQkxiVXlYdHZRNHlNWGZm?=
 =?utf-8?B?R0dKd3RMVlVyYlptQ3ljWkpaS00vendJcUliQkU0STloQ3RQTk1XMzZmYWt1?=
 =?utf-8?B?UXhLbFgwQkRPREF4YlFVMm5HMmp1VENUa3F1VkNPZXVCNE1RUEptZDRUbk9m?=
 =?utf-8?B?cWxKbnVQNUpVREVKNmdKektxN1Y0Ym1jcTR0allOanJITGpmdktlb3NWNmpJ?=
 =?utf-8?B?T3RWOGNwbUhKR0hvNkhpT3MvazFTdXNhYWFJWnlVKzhQRmQwTHQwMVNvUWI5?=
 =?utf-8?B?YVYrbERrb2RscENmYVdBZjZFS3AvVWQzSTg3dGpESGs1TnQ5aktRWUlnNmZz?=
 =?utf-8?B?KzJ0dE81aUREbWh4TzdFSFJ6ZTlHVlMrV0NndGNPbEwxYW1oZ0hlTWlIbjVv?=
 =?utf-8?B?SXh6Mks3U0VwdDYramtMSEtJMGxCTVMyc21HcmoyK1JZNkMwd0k3dXNJOGhY?=
 =?utf-8?B?WHN5N1k3Y1VqejBjTVptNUVvZEVRU1lQZkVBUjc4RDdRdmczaWdkcjREWExo?=
 =?utf-8?B?L1M0QisyVWhnOVFEZU5kbmpGbXdDZC9oSGRFZHRwM2phNW9OYlFtakdiM3Q0?=
 =?utf-8?B?S0ZQWm5HT0h2NEFUU0x2OXJxaHpyM0o5L09YMkU3cEhJUEtURHpWUjkrb24v?=
 =?utf-8?B?V0IwazNuTHNlZ2RCRnlSZmMzS2EzdTlPUTJrcG16TDBSZmU1aGlONkZMQk9H?=
 =?utf-8?B?QWZ1ZnBEdVROUWRydURpNUE3cW1hdlpsOUgrVXFoTFJNR2x3K3dSazZuZUdk?=
 =?utf-8?B?NWRnYmJONUNsQXFYa3ZnRUUzdTJRMXNoOUFZKzdrZm04WDhFWUNESk0zVzZB?=
 =?utf-8?B?VldmdWEwSjJiVnFiTFFuNVNya2c3Rjg3TFBsYm1KcG1qdDFvb0FnNHUyeDBS?=
 =?utf-8?B?Q0dzMHZ5SjdDai8yK1J5ajQ0UFNMbUxCQTJsL01IdG94eUljaDEyK3IzSjZK?=
 =?utf-8?B?SmtOVWNHRitaS0RIWlkrN1ZQTHcvV1pmTXhJN0ZrUXRIU3BGTWhzR0cvbmd6?=
 =?utf-8?B?UTNZWDU4YXlpditKSVhkYkE5MVJBdHpNRngrMnJDSlpWZ3pOc2k1MzhLekJS?=
 =?utf-8?B?MkdxclpLMHJSZkxXSWlnY0pBZDZvenI2WWNnTEtzWURzMmw4MkZPVWNjUjA2?=
 =?utf-8?B?UTdKTHVROElZVlNOZDhxU0ZBWWNUN3lMTjRFbStrdXdWTzR2YjJxT0RWVWFF?=
 =?utf-8?B?L3lCQUtMTTdmZDRDb3h1VmREZzRRL3RPZTd4aUdMbzNNWEU0NmNmT2piajNR?=
 =?utf-8?B?ajVNVEV1bWkyM2FlTmhhUTRhQkxxWmt5SjhhSGF4SklnRmZ2cDJTbmc5QVlz?=
 =?utf-8?B?Zzlxdi82VzZPUXRJLzQrNlA4YUZFSXFOQ3hHR05XOEVFSTdLUU9jT1JRWStp?=
 =?utf-8?B?M1BLejIwdlRWZVlReVdEVGdPcTJRYmw5dkI5TnRSMlhwZ2RJaU5uZUN0MHNC?=
 =?utf-8?B?bG1xbURSUGhtTkJaV2JVSzhQMVc0Q00vVmlRSmRVU0dPZmRKN2doNCtMWSsy?=
 =?utf-8?B?VmZSSjdyWkdWOUYrZXdLQVdVaCtvVVVLa2xxRFBRUG1qaFdQa2hYemRqTis0?=
 =?utf-8?B?aDlEOTJSN1EyUDRtT0hrUDNoM244a0l6NHpsZm9iQ1dsVHJiUXNTOEFRYUth?=
 =?utf-8?B?d090ZER3RDVReTBkQklLS2hzVTYyWjFFWGFUN0I4dW1mM0owTFZlRFRoMmky?=
 =?utf-8?B?RHhMQzRMZitjTkszNk1aSU1STEVjYU9vVHc2QTViNVQzcDB2Zi9JbVpUc2E5?=
 =?utf-8?B?NUUrZkg5elBkZk1NdnVRVnorcCsyMW0xNlNFbkY1WTBXZitGMlZrR080YXQ5?=
 =?utf-8?Q?y6SQWNry44k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bUxHa2llVmZISERldGZ0L1VtSGFFMGl5OEhIVklNSjIrZkJxeG5uODRtZTFX?=
 =?utf-8?B?U2hXTy9UYzUwT2tDSWg1WVU3OXRYejJqSG5UU0ZWMkxmVUt3SE05d2hub09z?=
 =?utf-8?B?NSsvS0RhYU4zMWUvSk9uUkcraEtjOVlYR2RtdkNFc0hDaGY5NlVPbXV5dGRK?=
 =?utf-8?B?eVVwVitlZzJBTmJ3UXFCM3NFclo0aEdWWThQcUNKc3c1T1N6T0RmeUNzRTEx?=
 =?utf-8?B?eG1zQU9FM2kvbFRrejdpTDdDeTlIWTZVMFIwOERydS94bDBrcGNGUTl0R1JY?=
 =?utf-8?B?aTlpVHQ3ZlZkeDJoVERFL2RTRCtlSDVmRFEwWmFLdjNzQmErampnYktQd0pI?=
 =?utf-8?B?NWNRNTJlYjl3OGNKUFZIUTJXd0lObTNNeVVOcTl2anYxeHlmYmRKNE9OMUx5?=
 =?utf-8?B?YXBsZTJCeTI0RGZmd3VsRXVXbkJZTlQvWmFsaklCTGY4cUtlZkU4UU5jNFBv?=
 =?utf-8?B?NmNnSXVCZzd2blMwMVFiNitCaUZXdW5FVSsxNTRUQ1c1M1JvbWhPeWZrL25Z?=
 =?utf-8?B?QlZWMm81TnNMUkhFd21RRlB0ZDEyT1FCeFBBLzl2eTlLQkFka1pUNDE3eEE1?=
 =?utf-8?B?WjRyTXFueWJWVU40Y3R4ek1pR010YW12SjNIbTI2RGgwOE1DZkxWcUpmU1NU?=
 =?utf-8?B?QlpLZFptWm9pdFNucWxyanIvcXBpR2ltN01yclN3eGdmQWNpSlo5Zi93U2c1?=
 =?utf-8?B?bnMwS1RHd2pMZVhJM3FqU0c5bVJvMkNtbW9BWm9uOUJFM0dBZlBkRGhhYzJ3?=
 =?utf-8?B?TWs4NW5MSi90SzZZR2gvclFLVnJGTjAybWZUbFJNcmlKdVp1dFdqMzJkOUJ6?=
 =?utf-8?B?ZVBnRnpMRFVCNnAxQ0dJS2p3RlBkU2ZZRGpnOTIxa3FmY29sVmgvdXBsOGJq?=
 =?utf-8?B?bC81cUhRMHNYM28waWZTanpJNEMySm5SelhQSnJuU2hmRDZ3bFVJQ21tS1FQ?=
 =?utf-8?B?NlZncGlEVHlSY3BZVmRMakRROG8vNTE1MG44TW5pc01BZFgrMzRuRU9aRk5q?=
 =?utf-8?B?eTZvM1NYV3RQdHpreEsxVGppUlhmVTVtOG9yNFJodTNBZU1TWnJXODZ3YzRS?=
 =?utf-8?B?bmZnOWZ4MjNKaFYrM3ppcjhFSUpjaG5TUXUrMWJwTDRlUzI1T2xkRTU4a3hw?=
 =?utf-8?B?ZGdWem9PMytyTkZQaUgwQ0hLZmJSN09hRWNwOHp6dXZOeXdIZUFlTDZOY2Ra?=
 =?utf-8?B?amVIL3JiZzJqZ2VPcWllY0NDTCt6VEhjRVBNRHNwZ1RZOThyVktPdTlIWWlt?=
 =?utf-8?B?SVB4cWU0TS84NkFqaTVvVUtBM2U4WVB2NEV2WVFVbG1udVlXdkZSOUcwSStV?=
 =?utf-8?B?MGMyTkFRZDdJYlJkWXNkOTlBZ0RkS2lIWkQ4MmpWU2RaM2hZZ3lmdGJBMnFj?=
 =?utf-8?B?V24zYVIxVDdBeTZ2em5TN3AzR1V6VEI5cXdNeHJHOFgwTUJxanNBRC83YVJj?=
 =?utf-8?B?ajVrTlZDbE1tdmJ5V3F4d3k2aGVtQXJtOFdGalphTGU2VmhtRWU4VHh3b1E1?=
 =?utf-8?B?NGpqZmY5OWJOc2hrU2c2N1RxcGN5bjgwN1l6UXphNVhiV1hSZmg4VmdoUUVI?=
 =?utf-8?B?VmgrZFp0dWd3VlMrWS9sZWpLT1ZqTzJ6ODlHT3dZU3U5bExzZmZVUGRET2Vu?=
 =?utf-8?B?MjRlN2F1OTJUaWdFVjdCZXpsMWV3ckZDZExjcmp4ZjFuZEtNSWlabHRkaVp2?=
 =?utf-8?B?d2V2UFhwVjZLUG5YTUk3SUxwNithMzdyb2NwNThBWFZ3eVhNRFAzU2FrQlNC?=
 =?utf-8?B?NEd2L01Pc2RTeHZ0a0gxQXE5cVJxT0JNQUdQR0RIcFE4RXp5K25VTGtLK1da?=
 =?utf-8?B?QXQ4endPdHlDY3FhQlFIdW9lUTY4cHN1Qkk3VWJIcDEzZ2VYek9qQmY1anB1?=
 =?utf-8?B?L2NoTURWK3R3VElxQmNOWUNuTENvbk9PSDJJYkc2NE9pbUQ4YnMvcTR1ZEFI?=
 =?utf-8?B?MC9IWE81bFhWclBuSGoxQ2dQR3dONFZjMVFDMUxhVUphMEtRWUJxOTNBK1JL?=
 =?utf-8?B?RWNPK2dXNWpWTUo1Wjh2K01TM3VWaWRja2VSYnp2QUJEdFA3MmRoSXlYaGlG?=
 =?utf-8?B?WVZSOCtHR29TS25RcEt6aU9FNmZUajdmYWhzVDhDT0NIVEFWYSs0ZG9uZ2tP?=
 =?utf-8?B?MGluQjdLU0VZSEk5WTdwZ3RaVVo4azVvcXpENU0wSGoyTjR5WUE1L3p5MnFJ?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D2B4D78E79E5A4C84591F027A25C1AD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4873f65e-2721-4ee3-af90-08ddb7cd3eb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 11:57:10.4460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AqF5HHSRCjcP65BoVW2NdajSY1LJObOcK3KXdxAWqMuQuJ6CV9uhOB37PtVRWWAy1aqkv/5d+l/+heM7yjX5JvGd/rRohuSQUojLwzZKOVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9638

DQoNCk9uIDI5LzA2LzIwMjUgMjE6MzQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgT2xla3Np
aSwNCj4NCj4gT24gMjkvMDYvMjAyNSAxNjo0MSwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+
ID4gLS0tPg0KPj4gSW4gdGhlIFZpcnR1YWxpemVkIHN5c3RlbToNCj4NCj4gVGhhbmtzIGZvciB0
aGUgbG9uZyBleHBsYW5hdGlvbi4gSW4gdGhpcyBzZWN0aW9uLCB5b3UgbWVudGlvbiBYZW4gYWxs
IA0KPiBvdmVyIHRoZSBwbGFjZS4gQnV0IGFzIHlvdSBwcmV2aW91c2x5IGFncmVlZCB0aGUgbXVs
dGktYWdlbnQgU0NNSSBpcyANCj4gbm90IFhlbiBzcGVjaWZpYy4gVG8gcHV0IGl0IGRpZmZlcmVu
dGx5LCBhc2lkZSB0aGUgZmFjdC4uLg0KPg0KPj4NCj4gPiAtIFRoZSBYZW4gaXMgcmVhbCBPU1BN
IHdoaWNoIG1hbmFnZXMgb3RoZXIgVmlydHVhbCBPU1BNIGFuZCBpdCANCj4gbmVlZHM+IGRlZGlj
YXRlZCBTQ01JIG1hbmFnZW1lbnQgY2hhbm5lbCB0aHJvdWdoIHdoaWNoDQo+PiDCoMKgIGl0IGNh
biBwZXJmb3JtIEhXIHJlc291cmNlcyBhc3NpZ25tZW50IGZvciBWaXJ0dWFsIE9TUE0gYnkNCj4+
IGNvbW11bmljYXRpbmcgd2l0aCBFTDIgU0NNSSBGVw0KPj4gwqDCoCBkdXJpbmcgVmlydHVhbCBP
U1BNIGNyZWF0aW9uIG9yIHJlbGVhc2UgSFcgcmVzb3VyY2VzIGR1cmluZyBWaXJ0dWFsDQo+PiBP
U1BNIGRlc3RydWN0aW9uLg0KPj4gwqDCoCBJbiB0aGUgZnV0dXJlIGl0IGFsc28gcG9zc2libGUg
dG8gZW5hYmxlIHN1Y2ggUE0gZmVhdHVyZSBhcyBTQ01JIA0KPj4gYmFzZWQNCj4+IENwdUZyZXEg
aW4gWGVuLg0KPj4NCj4+IMKgwqAgVGhlIFNDTUkgRFQgYmluZGluZyBmb3IgWGVuIFNDTUkgQWdl
bnQgZXhwZWN0ZWQgdG8gYmUgZXhhY3RseSB0aGUgDQo+PiBzYW1lDQo+PiBhcyBmb3IgYW55IE9T
UE0gKGxpa2UgTGludXgpIGFzIGZyb20NCj4+IMKgwqAgU0NNSSBGVyBwb2ludCBvZiBmZXcgaXQg
aXMganVzdCBPUyBydW5uaW5nIG9uIEFwcGxpY2F0aW9uIENvcmUgKHdoaWNoDQo+PiBzdWJzdGl0
dXRlcyByZWd1bGFyIE9TIC0gTGludXgsIFJUT1MpLg0KPj4gwqDCoCBTbyBubyBuZXcgU0NNSSBz
cGVjaWZpYyBiaW5kaW5ncyAoaW5jbHVkaW5nIGNvbXBhdGliaWxpdGllcykNCj4+IGludHJvZHVj
ZWQgbmVpdGhlciBpbiB0aGlzIHNlcmllcyBub3IgaW4gdGhpcyBwcm9wb3NhbC4NCj4+DQo+PiDC
oMKgIEluIG90aGVyIHdvcmRzLCBYZW4gbmVlZHMgdHdvIERUIHRvIGJvb3QsIGtpbmRhOg0KPj4g
wqDCoCAtIFhlbiBEVCAod2l0aCBib290aW5mbywgQXBwbGljYXRpb24gQ29yZSBpbmZvLCB1YXJ0
KQ0KPj4gwqDCoCAtIEhvc3QgUGxhdGZvcm0gRFQgKHNvdXJjZSBpbmZvcm1hdGlvbiB0byBjcmVh
dGUgZG9tYWlucykNCj4+IMKgwqDCoCBhbmQgaWYgdGhlcmUgd291bGQgYmUgdHdvIHNlcGFyYXRl
IERUcyAtIGVhY2ggd2lsbCBoYXZlIG93biBzdGFuZGFyZA0KPj4gKGJpbmRpbmdzKSBEVCBTQ01J
IG5vZGUuDQo+PiBBY2NvcmRpbmcgdG8gdGhlIGN1cnJlbnQgZGVzaWduIFhlbiBhY2NlcHRzIERU
IHdoaWNoIGlzIEhvc3QgUGxhdGZvcm0gRFQNCj4+IHdpdGggYWRkZWQgWGVuIGNvbmZpZ3VyYXRp
b24gc28gWGVuIFNDTUkgaW5mbyBpcyBhZGRlZCBpbiBYZW4NCj4+IGNvbmZpZ3VyYXRpb24gbm9k
ZSB1bmRlciAvY2hvc2VuLCBhbmQgbm8gRG9tYWlucyBpcyBleHBlY3RlZCB0byBzZWUgaXQNCj4+
IGV2ZXIuIEFmdGVyIFhlbiBpbml0aWFsaXphdGlvbiBEVCBub2RlcyBmcm9tIFhlbiBEVCBhcmUg
Y29waWVkIHRvIHRoZQ0KPj4gRG9tMCBkZXZpY2UgdHJlZS4gT3VyIHByb3Bvc2FsIGlzIHRvIGtl
ZXAgU0NNSSBjb25maWd1cmF0aW9uIGZyb20NCj4+IFBsYXRmb3JtIEhvc3QgRFQgdGhlwqAgc2Ft
ZSBzbyBpdCB3aWxsIGJlIGNvcGllZCB0byB0aGUgRG9tMCBkZXZpY2UgdHJlZS4NCj4+DQo+Pg0K
Pj4gLSB0aGUgbnVtYmVyIG9mIFZpcnR1YWwgTWFjaGluZXMgb3IgVmlydHVhbCBPU1BNcyAoaW4g
dGVybXMgb2YgU0NNSSkNCj4+IGRlcGVuZHMgb24gaHlwZXJ2aXNvciAoWGVuKSBjb25maWd1cmF0
aW9uLg0KPj4gwqDCoCBBbmQgVmlydHVhbCBPU1BNIGlzIGRlZmluZWQgYXMgVk0gd2hpY2ggaGFz
IGRpcmVjdCBhY2Nlc3MgdG8gSFcNCj4+IChwYXNzdGhyb3VnaCksIHNvIG5lZWQgYWNjZXNzDQo+
PiDCoMKgIFNDTUkgc2VydmljZXMgdG8gZ2V0IGZpbmUtZ3JhaW5lZCBhbmQgc2FmZSBhY2Nlc3Mg
dG8gcmVxdWlyZWQgDQo+PiBQbGF0Zm9ybQ0KPj4gSFcgcmVzb3VyY2VzLCBhbmQgYXZvaWQgaW50
ZXJmZXJlbmNlLg0KPj4NCj4+IMKgwqAgRXZlcnkgVmlydHVhbCBPU1BNIGlzIFNDTUkgYWdlbnQs
IHdoaWNoIHNlZXMgaXQncyBvd24gU0NNSSB0cmFuc3BvcnQsDQo+PiBhbmQgZG9lc24ndCBrbm93
IGFib3V0IG90aGVyIGFnZW50cy4NCj4+IMKgwqAgSW4gdGhlIGNhc2Ugb2YgRFQgLSB0aGUgc3Rh
bmRhcmQgU0NNSSBiaW5kaW5ncyBhcmUgdXNlZC4NCj4+DQo+PiAtIFNvIHRoZSBYZW4gaXMgdGhl
IG9ubHkgZW50aXR5IGluIHRoZSBwbGF0Zm9ybSB3aGljaCBuZWVkIHRvIGtub3cgYWJvdXQNCj4+
IG90aGVyIEFnZW50cy4NCj4+IMKgwqDCoCBUaGVyZWZvcmUsIHRoaXMgWGVuIHNwZWNpZmljIGNv
bmZpZ3VyYXRpb24gDQo+PiAieGVuLHNjbWktc2Vjb25kYXJ5LWFnZW50cyIsDQo+PiDCoMKgwqAg
Zm9yIHRoZSBjYXNlIG9mIHRoZSBFTDIgU0NNSSBGVywgaXMgaW50cm9kdWNlZCBhbmQgYWRkZWQg
dW5kZXIgdGhlDQo+PiAvY2hvc2VuIG5vZGUgKG9yIHhlbi1jb25maWcpLg0KPj4gwqDCoMKgIFVu
Zm9ydHVuYXRlbHksIHRoZXJlIGlzIG5vIHdheSB0byBkaXNjb3ZlciBBZ2VudCdzIGNvbmZpZ3Vy
YXRpb25zDQo+PiB1c2luZyBTQ01JIHByb3RvY29sIChiYXNlKSwgbGlrZSAiZnVuYy1pZCINCj4+
IMKgwqDCoCBhbmQgc2htZW0gcGFyYW1ldGVyIChvbmx5IGNhbiBnZXQgTnVtYmVyIG9mIEFnZW50
cywgYW5kIGRpc2NvdmVyIG93bg0KPj4gQWdlbnQgaWQpLCBzbyBvbmx5IG9wdGlvbiBpcyB0bw0K
Pj4gwqDCoMKgIGRlZmluZSB0aGlzIGluZm8gaW4gRFQgZm9yIFhlbi4gSG93ZXZlciwgWGVuIGNh
biB1c2Ugc2hhcmVkIG1lbW9yeQ0KPj4gcmVnaW9ucyBhbmQgZnVuY19pZHMgb2YgdGhlIG90aGVy
IEFnZW50cyB0b8KgwqAgZGV0ZXJtaW5lIGFnZW50X2lkIHVzaW5nDQo+PiBiYXNlIHByb3RvY29s
LiBUaGF0J3Mgd2h5IGl0IHdhcyBkZWNpZGVkIHRvIG1ha2UgYWdlbnRfaWQgaW4NCj4+ICJ4ZW0s
c2NtaS1zZWNvbmRhcnktYWdlbnRzIiBvcHRpb25hbC4NCj4NCj4NCj4gLi4uIHRoZSBuYW1lIG9m
IHRoaXMgcHJvcGVydHkgY29udGFpbnMgInhlbiIsIEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCAN
Cj4gd2h5IHRoZSBiaW5kaW5nIGNvdWxkIG5vdCBiZSB1c2VkIGJ5IG90aGVyIGh5cGVydmlzb3Jz
LiBJT1csIHdoYXQgaWYgDQo+IGFib3ZlIHlvdSBzL3hlbi9LVk0vIChvciBhbnkgb3RoZXIgaHlw
ZXJ2aXNvciB5b3UgY29tZSB1cCB3aXRoKT8gQXJlIA0KPiB0aGV5IGFsbCBnb2luZyB0byBjcmVh
dGUgdGhlaXIgb3duIGJpbmRpbmdzPyBJIHdvdWxkIGd1ZXNzIG5vdCBnaXZlbiANCj4gdGhlIHNp
bmdsZSBhZ2VudCBpcyBhbHJlYWR5IGdlbmVyaWMgKGlmIEkgYW0gbm90IG1pc3Rha2VuLCBib3Ro
IExpbnV4IA0KPiBhbmQgWGVuIGFyZSB1c2luZyBpdCkNCj4NCktWTSBbMV0gaXMgbm90IGFwcGxp
Y2FibGUgaGVyZSBhcyBpdCBzdGFydHMgdW5kZXIvaW5zaWRlIExpbnV4LCBzbyBpdCANCmRvZXNu
J3QgaGF2ZSBkaXJlY3QgYWNjZXNzIHRvIFNDTUksIHRoZSBMaW51eCBkb2VzLg0KQW5kIExpbnV4
IHdpbGwgc2VlIG9ubHkgb25lIFNDTUkgdHJhbnNwb3J0IChBZ2VudCkuDQpTZWVtcywgdGhlIG9u
bHkgb3B0aW9uIHBvc3NpYmxlIGlzIHZpcnRpby1zY21pIChxZW11KSAtIHRoZSB2aXJ0aW8tc2Nt
aSANCnBvdGVudGlhbGx5IGNhbiBzaW11bGF0ZSBtdWx0aS1jaGFubmVsLA0KYnV0IHRoaXMgaXMg
b3V0IGlmIHNjb3BlIG9mIHRoaXMgd29yay4NCg0KUU5YIFswXSByZWxpZXMgb24gY29uZmlndXJh
dGlvbiBmaWxlcyByYXRoZXIgdGhhbiB0aGUgRGV2aWNlIFRyZWUuDQoNClswXSANCmh0dHBzOi8v
d3d3LnFueC5jb20vZGV2ZWxvcGVycy9kb2NzLzguMC9jb20ucW54LmRvYy5oeXBlcnZpc29yLnVz
ZXIvdG9waWMvY29uZmlnL2h5cC5odG1sDQpbMV0gDQpodHRwczovL3RydWVjb25mLmNvbS9ibG9n
L2tub3dsZWRnZS1iYXNlL2NvbmZpZ3VyZS1rdm0taHlwZXJ2aXNvci11YnVudHUtc2VydmVyI0tW
TV9jb25maWd1cmF0aW9uDQoNCj4gSSB3aWxsIG5vdCBpbnNpc3Qgb24gbW92aW5nIHRoZSBiaW5k
aW5nIG91dHNpZGUgb2YgL2Nob3NlbiBpZiB0aGUgDQo+IG90aGVyIG1haW50YWluZXJzIHRoaW5r
IHRoaXMgaXMgdGhlIGJlc3QuIEJ1dCBJIHRoaW5rIHRoaXMgaXMgDQo+IHNob3J0c2lnaHRlZCB0
byBhZGQgInhlbiIgaW4gYWxsIHRoZSBuYW1lIG9yIHB1dCBpdCBpbiBhIFhlbiBzcGVjaWZpYyAN
Cj4gcG9zaXRpb24uDQo+DQo+IFVsdGltYXRlbHkgd2hhdCBJIHdhbnQgdG8gYXZvaWQgaXMgd2Ug
aGF2ZSB0byBzdXBwb3J0IG11bHRpcGxlIA0KPiBiaW5kaW5ncyBpbiBYZW4gYmVjYXVzZSBzb21l
b25lIGVsc2UgZGVjaWRlZCB0byBjcmVhdGUgYSBuZXcgYmluZGluZyANCj4gYXMgd2UgZGlkbid0
IGV2ZW4gYXR0ZW1wdCB0byBtYWtlIG91cnMgZ2VuZXJpYy4uLg0KPg0KDQpOb3QgYXdhcmUgb2Yg
YW55IHNpbWlsYXIgdGFzayBkb25lIG9yIGluIHByb2dyZXNzLg0KPiBDaGVlcnMsDQo+DQo=

