Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F869E6D3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 19:06:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499147.770189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUX1V-0008S7-0E; Tue, 21 Feb 2023 18:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499147.770189; Tue, 21 Feb 2023 18:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUX1U-0008Ot-TW; Tue, 21 Feb 2023 18:05:52 +0000
Received: by outflank-mailman (input) for mailman id 499147;
 Tue, 21 Feb 2023 18:05:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUX1T-0008On-1J
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 18:05:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d19e0ac-b212-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 19:05:47 +0100 (CET)
Received: from mail-dm6nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 13:05:44 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5251.namprd03.prod.outlook.com (2603:10b6:a03:22b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 18:05:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 18:05:42 +0000
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
X-Inumbo-ID: 5d19e0ac-b212-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677002747;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Fp/pxNOae4UU+0q7K7xEtDFxcv7JNCW6Zq44M22EC2Q=;
  b=Xts5pddNpZ4/uKw0+LMOmXlD73FIPUC9eaXIRd69WSkv4iBxSv3xxhVW
   eN5KLqBiujTx8Qr94LQB2NryweQtAxTkCVUvZRl2qCa4tlOtvIiJVQxfk
   2Uthzqyn9hiFxX474fCSXEVIQ1+If7vXstWFaJbzQtfZ8n55hD7xGvoyg
   I=;
X-IronPort-RemoteIP: 104.47.73.43
X-IronPort-MID: 97949463
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kk8o56jWhrlhSlRPeidWNr3iX161fxEKZh0ujC45NGQN5FlHY01je
 htvDz2DO6uDZmv0fIx3bd7n8UMPvpbcy99qGwFr+CE8H3kb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gWHzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQYCSoNaEDAgtmvmoziY8BCnu4ya5LCadZ3VnFIlVk1DN4AaLWbH+DmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMqluS2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDS+zkp6I02zV/wEQVUBM3DXCSkcO9yV+ZHPUGM
 VYIpyEx+P1aGEuDC4OVsweDiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceRzYny
 1uIlNPBHiF0vfueTnf1y1uPhTa7OCxQIWpcYyYBFVcB+4O7/Np1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxlgRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:23MZ36kBKiNTfoLoH+yOO4OYTZXpDfIT3DAbv31ZSRFFG/FwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97949463"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFLGYt/NgiNPva7rXPbYVYscnQfE4donkk5xH0aQZ87t5Ov3FnSMtANkQuIRvrJETU8zyKsZbNoDcHoWzE4pGYN32o+EhGC8ioF2eVaFBuEYLjM6yBlpuqMUK4Dp409NKOZfPD/inqoF4sj49UgWYQ2ie1cDy4q7alZ638GQl1Q2V/uPnmFOGK2lB3y9AUSsukYtydarFYc/R6xpdis0QJnOtQTDRssY45xzYQM8FDQkSrGJx9Qi99HLu8ctBmxAZc19/jnXNFp17PozEycJ01YJAjKJX9winFlX4EUdRKdbZS0ezKU/OU2o9NFuw1272al1wUKpmh0ItXtoTU7+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fp/pxNOae4UU+0q7K7xEtDFxcv7JNCW6Zq44M22EC2Q=;
 b=bPQgZwztrRZvqdTgfGk/97NWljh6jPhqMpZzmbUyERjUTS56zJdn4pyIt/1Ih9ciBXSPliIW+RgQMDaCmydOlWZ+5cOMHXnsZ5SatGOkXRHkU3SO3EDTm8UWp13OJSkBxWg8XvQWCNHhjUdTy3L5CY6ZASA5tPgc02P1Qqgpq/8Hkk2Ul241GOhkFOpQcLsvwrXw3q9iMVplHqGDgaOTkeMLqZIZGPZT8mZsWZa/G2XD58QGVYsnmjuqR6PtJhyJ5jcKXTPnXBQcJ757vBYbutyyo2IkiHC/wtMypCpN1ZhXsjsPzlDUFqse5eiT1v0biWBrTZxB9LfwI4KxeBrjyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fp/pxNOae4UU+0q7K7xEtDFxcv7JNCW6Zq44M22EC2Q=;
 b=fQDdA6dT3JTrdkWwFMtnK7x74hAwiz3avVNY6Wp+iuPOYQNTb19RhlGFDbtcOJDGhOfCSt+uTEo9FXAkjqNxhREbaGXx6vqV4qKUg2+6c+s9FtUaUDme5PQDlNS3ceAj0hVsrV97/m5LZRwuADLD35fnAbadcvoKutJbVr1iWEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <19396277-127d-1127-cdad-341368f97e92@citrix.com>
Date: Tue, 21 Feb 2023 18:05:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Debian randconfig failure, Was Re: [XEN PATCH v2 0/7] automation:
 Update containers to allow HTTPS access to xenbits
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
In-Reply-To: <20230221165542.7642-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5251:EE_
X-MS-Office365-Filtering-Correlation-Id: b32e2613-20ea-4d19-e43d-08db14363f20
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bD1lsSH0PO4yJ2PjiEYCVO9U+vny3l5VdTDR6n5P0NkBdyb0Rm7oBwgYNYaLwjRV+gj+zBa5LWI53Vhu8+ka9UCubYmyTMyuogs/EyIbRc+vay5fheRRDEyJ2r7dNotreERH6b1m0SCmQvrP+kdh+fpiuCMQGvoLAjNeq++s1j34eq5fpy0pcemrki1TfCFp6v7dE39zddehKUGV9l2sbEFYkIs3g1R0VR7asBA4zruFLIn6odRUJYfRobo2GQT2W4hkBttQb6F/vS2Cx9GtTCCI2690RyDX+pDh2rZUyK8ga/HyCgeSjg5Z9pyiJ/AGrH87nPjrpaeQ3Ur5LaNAgRN0HrGOvwdaAvYrB3973yPCkyC+tqDFrJhKudhSssH3X9UWybM0QVWNFE5smNQ7g15zkzxlFJd55A1dw6Noz6fui5ocBmpYkkEGbH9hd0nJL8lWxOlnWGr6BgEJDo6xjlaQ17pzj7l5uLCBR/QX9Z0iGIcoGsPCIV/WYey6izBkUPfgUUp45+HvO0DuPpuOso6i8y6QGXgzaZNYohJAcERvzTFiQaFRAaFxopqgiVqfDzlL10jMPgTcWsOCL4ZM9UNd517CuTuvbdMLYbBmYLk/Z+qErAYpXF93TQTMtkf7/KAJpoBTfKe6lX+h5ZSoUjEcS1ha32RPXM0ESSf1hWNNqz853CC69uBFm40/zy0nEmKNeIxnGlcrgDYMLCLBKkaKgk5vxHETzfQd/O9j1Y0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199018)(31696002)(86362001)(36756003)(66556008)(186003)(66476007)(4326008)(6512007)(26005)(8676002)(8936002)(5660300002)(2616005)(316002)(41300700001)(966005)(478600001)(6486002)(66946007)(6506007)(53546011)(6666004)(38100700002)(82960400001)(83380400001)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXpkaTNVU0JzVkhwUktDSjhRNFp3TzV0U2hYWFAvSHBxQmpvR3dGRWc0QVIx?=
 =?utf-8?B?SjJ0MVZPcEE2UWVnTkJPNitkdXI1YXFRaWxPRTB4ZmdrUXdNcEZvSThCRlFx?=
 =?utf-8?B?MFN2QUhuKzN0L2pnZmZ4eVE4ZjZJTGQ0dGhxbGRBMXE1aEl3eHA2R3FSM2lJ?=
 =?utf-8?B?MVZFQ3Z2NUtQemFsc1o4c0J5TDJjcDFiNExXN3ZCdVVDRVBNK0FONXRqZEdV?=
 =?utf-8?B?bjlRNFdYUm5CVFQxWm9vd2xLaXg0SUhXbWRHWXg3S21xekpndy9Kd1grWHNz?=
 =?utf-8?B?MEVLYU9mOXNLdWVBeWVWOUtSYTRtQ2NrazBuS3Z5dFc3Y0E1NzJxK1FWaXJo?=
 =?utf-8?B?a2FCdTFmMGlLN2xpcGxhL0VHWDVQbnRxcjduTmRjOG5RTmJSTnRmSTB3WXFB?=
 =?utf-8?B?TzNwK3FSWGZMS25UeU0ybmpQcUNlM0NmdmpRdStEZUdSd1JlcDIwdndrSm5k?=
 =?utf-8?B?WXVtZGltaUdiMllsdGJPWVZGaXRXRVhIeTk0azlObFBRTmZZM01JRklxdHhJ?=
 =?utf-8?B?dEJ2K2VDb1ZqaWVhL3Z1ZTM5b2M0VE1lKzczM0JDY3cxaDRFLytvQU4vVkxP?=
 =?utf-8?B?djg1NzRzMmNtNHJ0NCtPSkRZYXNxaWJUdVhoRHdWR3ErUTJxdW9YVklZNjIr?=
 =?utf-8?B?OVFkRWt0Wk0vNW5ha0kyVGFvVmF0cElUYmNpYzhnTkRyanErcHp6SEpZZ29S?=
 =?utf-8?B?bDlhemR5ekkxeGQycDdsb2wyVFBkbndpTEs0SWxIa250dlZFd0FjLzBES2hs?=
 =?utf-8?B?Q2lYaU43SXRUUUNzYTlQcGh4aTJEdzNsdlpQNUVUTi8ydEpjUFdHekw5ZXcr?=
 =?utf-8?B?OWZ2QWhuWjVUeVRFWTFEOXd4RmNLNENxZFVadE14SFJwWkM2ZWp0OUR3bkw5?=
 =?utf-8?B?ZG5wWlNoYk9UR0ZNZ0RmY0tDVGJjZnBlQnczd2FoenR5TjM2cm5jYjV4NE00?=
 =?utf-8?B?UlZLMXVkYkh6ZlVtZmdiY3lJYUc4YndIc3RQMTZ6QXUzZ0twVU9JYzFIOGtU?=
 =?utf-8?B?SzgvelhqdFlrWWZzZnVqTWhaVksrRGZGVDdnMFVsdG1XYjd4YkQzdFFqVGN3?=
 =?utf-8?B?UWloeTM3Q1hrRDdxVmlmK09kL01XVDl3bFdXT3FGTHpjd0xwNngwUFNJV0tL?=
 =?utf-8?B?MlpKVTREcVdYMG1HM0FrQmQ0eUpmVXRLRzRjRGRhNEQwZjE2NzhsVnBDWTA3?=
 =?utf-8?B?OVFEc3JpbkRXMWNQdjVXNTNLUTNuMHZ0aktNQUdkL0hpUFR0NEI4cmlxSU52?=
 =?utf-8?B?RFNRYzlBR2czSTZub0Q1eGk1SWJNbXEramR0dHhLTStOb0NwZWN1WlIxMFZ4?=
 =?utf-8?B?eEkrSW1jVGhrWnNEaG1rN0t0OTRmKzNwMjY3TW9rWEZmRjRyYkU0ZXROdnF2?=
 =?utf-8?B?bXpiMHNrNXZEbTV2ZHJZcTN2bXFDbWU1RUNjczh6YVJPWWFkODYyWTk0Mjlo?=
 =?utf-8?B?c0N6YUYwbHRHbHpqSkRrVXdQRy9VVm9uYmV6US9UNkZYeUlwaGVuaW11YXdC?=
 =?utf-8?B?ek1pTTd5blIvbHJGS2tabUVVVnRGUU1jWnpxM1VxYXd6WngvQmg1SWdDUVNV?=
 =?utf-8?B?MVNmckVxRUpDckFKYVhoKzZ1bG11KzVPUmo4TDVyQ0hKSVowSGdhcjFmRm4r?=
 =?utf-8?B?VWR4MkQwQURZbW5Lc1Y1RFRrejNtRmYwREU2dVVvWTgrbi9mQVd5T0N0UW5L?=
 =?utf-8?B?N1lRTXY5SnF0VkQ3dDN6S0d0K0N2UWRScUZmcDMveDdTQXBON1VHUlV5Vmlw?=
 =?utf-8?B?OVNYeHcwKzI3Uzh1c2VIUjZleTZEMU9IV2UrYVhwTERsdHM0bkpueTZVVTBP?=
 =?utf-8?B?dTFqZlpMNzhxOFlUZ0Njb3ozc2J0WmpNUHZ1YldTQjY4cVhlVWpVLzF6ZjZq?=
 =?utf-8?B?T2R3MFB1SDRPUkpWTFZsbWdNME40ZGRzQVEwY0dOZ0RDblhsaXZwRENqdTli?=
 =?utf-8?B?MXhhOGowdmtPMjdNa0VNZUdJZ21UVmRFYWFTWjJqYTVJMTlYNVN1THVJWHdm?=
 =?utf-8?B?QitzYmdMeWxXeUFhMi9tUjMrVDYxOUNaeWxmR1RHcUdmV1hxL29RbUZmQ1RJ?=
 =?utf-8?B?cUlEb2F0UUNwdEc5T2djWHRySWtkRytpSitKblpGTjZKQm5lS0NVWXdCd1Rz?=
 =?utf-8?B?eUp6aGVTL0ZaTXkvVkQ4RUZxeW11VFpLcHZFRlR1Rklkb0ppZHVrcWxGRWpa?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xbl9nrFP/fjaTCX4tEPet2L4nc+yFqygq/gN43dX6gqjebmoPlnEwSqjvx+x77pDV0eJHPa1nsIMq/VBUQdPfwNOyP+s2ghQFDZSnxaseHbrJ6NUELm0MDUFokshhYrCe2KQFPoCAgbXYVg5Hhx+eSSJo3pLF5kTNw6JXNJMoakZFBcqM8G2V6S3tLXw291b7k+WXU5qDroHqspqwdtw70WlWp4Wtb/2WYZpdYBHpjFJqYVFPaYQCxuS6ohSEPY9QTcUIIOaKqfgmimh8ye0g8ci/3FTcNAuZhNzBgsOCKXjrGCAQBa5l6QW+sYaHL0xExxQaHUODytlBwACN+uFVN+KI1WWpAD7cS5HAsa8ajmnSbG5LGAzMaop/YPm1vLoofRubj7WzzebUkq4dX2mcY8LLf8lWbCdxuhBc7OZqirV9UjNV809at1CUFCOkzCiNSRi8GLdmDa2wPvLpVkUOpgv9KUNbYfpr5fHI0SMad2OsI9Ei6EaO7kjgWbKHMP+UiFPzOXtw3TJgIfEnBGw4G231FsO9jrKkCWIa5eZqCMlO7fAyoaMn5CiztYeo456T5GrVZLjoM93UQmNTgI3e85p+6pPpob9wKmrxuQDV7rIGqDEWItW0f1uMwT+WEK/dyt8eL1EFaz8F1T67c9yzJcm5Z6PxVS0E6wQY9cC5alioCrzZVeiEryeBlUkfx0aw5P3fp7zHrHNRrMeM/up/gR3ZZ+pWI0g6Dl7jO8vLnl991JwGvljP/glUL/KKhgVwtB/FWNSTCJl5wjI06kOvlns2W3lrXga/kjEy5c8zIw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32e2613-20ea-4d19-e43d-08db14363f20
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 18:05:42.5622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VP+HgrlXr8mDGEFicHhtUv6Kt7TghHkEFsXTm10BTi6udWedsF3uMSdA8JJ5txhmSV25wL5KsM2n5ZGaC/BfpKKjTYRWfnaETwZxoHNOEys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5251

On 21/02/2023 4:55 pm, Anthony PERARD wrote:
> Building randconfig on debian unstable seems to be an issue.

You're talking about
https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/3769926509 ?

+ gcc --version
gcc (Debian 12.2.0-14) 12.2.0

arch/x86/extable.c: In function 'search_pre_exception_table':
arch/x86/extable.c:200:27: error: array subscript -1 is outside array
bounds of 'struct exception_table_entry[1152921504606846975]'
[-Werror=array-bounds]
  200 |     unsigned long fixup = search_one_extable(
      |                           ^~~~~~~~~~~~~~~~~~~
  201 |         __start___pre_ex_table, __stop___pre_ex_table-1, addr);
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from arch/x86/extable.c:8:
./arch/x86/include/asm/uaccess.h:414:37: note: at offset -8 into object
'__stop___pre_ex_table' of size [0, 9223372036854775807]
  414 | extern struct exception_table_entry __stop___pre_ex_table[];
      |                                     ^~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [Rules.mk:246: arch/x86/extable.o] Error 1

Jan: do we need some more gcc-wrap sprinkled around?

~Andrew

