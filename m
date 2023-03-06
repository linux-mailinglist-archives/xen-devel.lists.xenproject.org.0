Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248A06ABE82
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 12:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506917.780137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ9GJ-0006ll-LX; Mon, 06 Mar 2023 11:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506917.780137; Mon, 06 Mar 2023 11:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ9GJ-0006iW-IX; Mon, 06 Mar 2023 11:44:15 +0000
Received: by outflank-mailman (input) for mailman id 506917;
 Mon, 06 Mar 2023 11:44:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnE+=66=citrix.com=prvs=4220c523c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pZ9GH-0006iQ-Pp
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 11:44:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34f75c28-bc14-11ed-96b5-2f268f93b82a;
 Mon, 06 Mar 2023 12:44:11 +0100 (CET)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Mar 2023 06:44:08 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5239.namprd03.prod.outlook.com (2603:10b6:610:a2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:44:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Mon, 6 Mar 2023
 11:44:06 +0000
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
X-Inumbo-ID: 34f75c28-bc14-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678103051;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=e8ZLogsmPMkBO1El3/urDrsDGsvKVvWzAxDVum6+L6E=;
  b=W4D7gALtoqzAMNUpol0dxaQvnLS3doRf0NMYoZFi+SdK01WaMsVZtfk1
   xasX1Vc+0f4ookzz0MdzXs+SQkdHWvzvGRf/iwD93RFhzh4TO9r0pudH8
   8MDwdhoefpjVNyYMf3YZ3/RKxy/1yMIHSXaIaCTMwbGKfyIg0y1tu1qj7
   U=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 99660958
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ElrJ4arm7DRjqUAFlORUgi1HEVdeBmIGZBIvgKrLsJaIsI4StFCzt
 garIBnSbP+PNDOmeYx0bti0oUxVvJHXnNI3TANl+yFhH35D8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzydNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAD5OTBCp2/Ku+oqAQ89BotYHFJO1J6pK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKLEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpp6A02AzOlgT/DjVKc0P8+aCVhXejSshNB
 mMquSct8PY9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHYDBeSwIAuoHnuNtq1kyJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:AS2OaK2CSp02Kkzm5OAK2wqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.98,236,1673931600"; 
   d="scan'208";a="99660958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I91aelhJQvMMO6rE9PyBHEBa2pu9I1iIgK/GD5WZg068+m6KXTrShV6x4Riom2plEEpdm3/gB/wotGs6zETUU0zOOGXTnwiyZnPZpFiW7/O/U0p91XctlIAoPVHqZJkXoyFD77xYYX5I4UJL8FqzgW8QzArC/SMixUZiPwG74Z4ZDu9jlO7ZAGign47tMiXVa63qoFAj5FKVbCulLaB9yQo2h4wS3nU7u+QR8FrlgfMIbFEhfHOvM8Z1UxE4NjIF/MXJL/Xr3BwCsC0tLq/ZtkH2zGlUl/17H/xhKQZ+EZfRpu3MmtX/6yctr8se5tNYsEG91EIvLqDbLoBxDLgg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8ZLogsmPMkBO1El3/urDrsDGsvKVvWzAxDVum6+L6E=;
 b=nTo3KQryrrDayuiTHQz0CrtCCsggPlDCyG6/u/LxTIMlRjVhA9CUivcwXAhriC2cWbjgaPXOGik0Y7bBEZPhzKHJ9yUEGJLB8lqUqpe4JGfdz+yECcXFJLEh1xg/pu/mI6JBQ1uH5ohKICvaAMjl+1N1oNOdrO3ekJeOH6IrZBECaEt9o2owZlYQfcFDS7uM4DdiIxAPwqN9b7ffdH9L1lCXJvy248VFLL5zoSt3TcPPRDyIg11SMN1YDa6L1rnQGLuCKrrxaeNONjaVcil73nr1H4jlHegFHCH2jjJ6cLRhZWGfk8rVNCiY6JIL3MuWpZpI7O8d73JTVYKSQKeEYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8ZLogsmPMkBO1El3/urDrsDGsvKVvWzAxDVum6+L6E=;
 b=PV98aCRO8xfWqY+7ZXWnduQGwHUe6aouZJeJ/JNlAbUMmwkvZ/jYmp26xSZRx5GDNN6YfMHiIVOcsLcw+AjT2dqCqe1jj01e/Q+2vP9gWsgUbIFC/hhjtSqvtWKYhRqQQ31Lg0nPJ8q5oqDUVjTCc1hVtQgg9t0ecv3jnykpAco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <05a15bdf-cd5b-5312-f095-5d905d290c55@citrix.com>
Date: Mon, 6 Mar 2023 11:44:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Backports for stable branches
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <4257ff30-0ece-4138-20f2-b7a3e5a91522@citrix.com>
 <ab40c09a-86da-faf6-6976-fa68537d5ecf@suse.com>
In-Reply-To: <ab40c09a-86da-faf6-6976-fa68537d5ecf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e84f7d-7c30-4556-dd82-08db1e38171c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5DH1kv6zs4gNYbRjDeQnPGJehEMcJ4Gfk6I86wYJInIpc70P+rMXFwImIDoTnTvEyaGilJvs0/7T8q8Ai1fGEKDGVaK7YCEuvo6JrBjt6CBW2ypxhhHb6iBW8ZQt0fKgXwoqUhJYp+bzP98EikPG7YgABjXa4z+IyWfbcmtFehddj+rKPJNugnJbREbO29LLWFtYqR020NXf8AMYSdrQNZF9Oeei2KNbPiwNvilCOFmxD+XtZKjiWw05bhM19Bo2XWOLSkNWyHsGdGBtKRh300zKgJYjm3Vq0iIH2QTowpqke8lhJysUKYQSJSgSULWBiO+EdXHX7YWpHad5oEcZPeOUVS6/tndZBaGFJsUL7iT1Hch7jBS67qbHgDCzPmc6bdUZv4F+UMJ61mVSB8c4P6E2WXov1URuM6z1rg/W0Os/N70NTpuFRdGqFzJY42QQXefC/0D6iguREG6u6NUFd9sKjRs1paYxHvfjjXLVz0XAH53Ucp6OQYJtavmBDOmMq8SEAeQjVu/E2sprPjvYbOjsrulve5SX2nnsshpRcpOV3TPgZw95AbiGOycaO7E1xIBptc7GRahbZSKmzs9XZVCjtqbqscHbw5+ktCCPig+xft+Lo4m0RDyr4aQ2/alxd0oXm78/JeYN9GhhQj9h2hSvtvne9BPUcI4PL8FndHzuv2v43tUUroYvsrrttqR066St5NL4i9tYiGlnvDcE6yGMHLip6/h3B0/pMRW9Pyc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199018)(6506007)(53546011)(6486002)(6666004)(107886003)(3480700007)(36756003)(83380400001)(86362001)(31696002)(82960400001)(38100700002)(6512007)(186003)(26005)(2616005)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(6916009)(2906002)(8936002)(31686004)(5660300002)(316002)(54906003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkZSdDNJZGZYcGxyN0dMRXg4TnM0eVdjYnpUZ2RZOXVFb2ZLd0JpTW5DOGFS?=
 =?utf-8?B?SC9LZG9Kc0pOY09OR3p3eTFZWW5Ed2lOR2hMc1dJMkFrZGsxSnlxL2Evdno0?=
 =?utf-8?B?MGJkWEV3MlY5RlhzemZWclNyVk9QUkhETmhuMDU1cWxNK0FkTnduZ1BvbGp0?=
 =?utf-8?B?MlpHdGo2aUlWcW5HOEc0MkFsK0x5RDBqRGVhb2lxOExqWjlZRDc3eW1ia1VB?=
 =?utf-8?B?RDU3cW9vc25FNUFMLzVsMGFqTERvaDZ1N3MyM1pQbkZxL05qdnlpZzJDK3B1?=
 =?utf-8?B?amlZT00zU3dQT2loNm9mRW5ObVpjbzA3QlBOcVJ5bGFFV3NRS2czbEF6dU1V?=
 =?utf-8?B?WWtYU2pLd1ZlcUkyNVRGVnJqWkJROCt6YjVhMTNQUWs3byt4dllSWEpkK21T?=
 =?utf-8?B?SGlScnZybjZ1QTdZajFINW1ydDU4OUNlSStTd3VVTVFKSUM5djB4aUp3bGNQ?=
 =?utf-8?B?b0Y5cTlLQW9GZjV2MStzSm1xVWxGdU9zVGo1c0dvN1p0STlScWpkbzlhZDNy?=
 =?utf-8?B?Y0NFNG8wTWlMdHRzTWJNS1JpdGtxQ3ZmcEhjZXpQOG13UE83dXFaZnhkcG1l?=
 =?utf-8?B?QzhScVhXMUg1VEt5eUFaRWlwUktJd0d1MlVtcEI0U09FS2QxZ0JlU0tGK0Nj?=
 =?utf-8?B?K2FpUk5jVzZXK3NNU1hBanQwbkZvQXBWQ1ZTSlNVNmZDYkM1YU1wNDBGcHdr?=
 =?utf-8?B?SFpEN2xuVEFrSktpdVRFdnVacFVtNEszN3pjdWlmdjU2ZlRaUXRDdlNtQmpW?=
 =?utf-8?B?UFlWTDRIVm9QMTBCaWkzZzk0dGFWcndOQmJaYjlKWDBzMm1FakswOWN0M01i?=
 =?utf-8?B?TVNQVWVPVkJ4b0VSVFVTd2lLQ1FaTzBaS1J5MmRMNkRRS3A5T1lTc09uSnBo?=
 =?utf-8?B?anlmemRaOVJsOU9TQWtCd0hUNEZHcVdJWnJXYmxyRlNjOElOTmh3WnZRRlNG?=
 =?utf-8?B?S2FjbE5qZnFCNUw5V0ZjYmpRYklFZ3Q3U2NnczQzb29qVTMvaUUzNW5aSEZM?=
 =?utf-8?B?SlluSEJFc2Y4bW5uNnBpdStUL0JReE02UEEwNmRzRGpCK1QzeDJNWTJLVUxB?=
 =?utf-8?B?NTlwbjBab1B0RklSNUpnRzkzZitZd3hqaGx2RVlRa2dlc3daSkYxNUROb0ho?=
 =?utf-8?B?Wktyd2ZEUlVuTUVNblFRM3cwb2N2SG94elI5cjhCVSsza0Fwek1RbjU5ZDFO?=
 =?utf-8?B?YXZkOUZOUTlKamhZeVRHemFWbWdNL3VTcXl0MkowY2V3cis3U1VDZ3crSkdt?=
 =?utf-8?B?NG1ScDlXVGxSa2JoNWk2TGJicGFNQlM0ckNNU0pqRTZrWHAzWlIwM2pmcExB?=
 =?utf-8?B?eUpyeExuVVNWYTM1MEFQZlZPT1U3K2xLTW0vWjZUOGlQVkJPUis5SlIvTmNr?=
 =?utf-8?B?Nk13SlMyTWhzc2xqV3FJUUFrLzVKQlN3ZkxnR01qR1FFL2JyMnpDbjhmQVdm?=
 =?utf-8?B?MUM4N0JHZnJPYnB1NHJRdVZZeFN4NGFHaStFbFV6SllPY25MSUM3d1hOZmJm?=
 =?utf-8?B?RWVTT3VTWUgwajdEYmswZmZacXdQRkk0RnRWZEk1T1VMN1lKcE9oWEptSTla?=
 =?utf-8?B?SCtSMEc4Vk9zeGlBWWZUdzZCUEpZd001a2pJcmRHcEMzK214ZjBCMGw2WVND?=
 =?utf-8?B?bGJ3czZMQlc4ZHc0NHpaa2k4Y0R6VHhEUGVwTDEwOEpTTzdueTNnZDNENHRT?=
 =?utf-8?B?cFBlSkJmRExUakMzUUkvMC9Ub3lOc2VSWTBrSEd1QnpOUnlyRnZIckhoY0tz?=
 =?utf-8?B?VUhBV1pHT3liTTZyYkVaOWFmZ2diR2lOL0tWbURxZmhwNUt3R0JBeGZ6d2FL?=
 =?utf-8?B?dDc2bDRKZjM2Q2N3SjZReDg4Y1ZhcUFUZmZZTnZrQTU5VWRGY3dYYTl4Vi9q?=
 =?utf-8?B?c0Nad2diTkNlM3RFd2VNR0o4M1JueC9uVDFFK2w1b2lxdnZOSkhTMmcvZm9U?=
 =?utf-8?B?NDliK3JjRGpFaTVvWWo2aXFXa0hPd25XNmhSNXlNeUM3UWk1Y0NlTkluSjVx?=
 =?utf-8?B?YVJWTTR3UXcxM3RwUnkyMStucFNPTEdyUDV2TFMzM3Ivd1M2V0ZPSE1Ud0Fp?=
 =?utf-8?B?MS9Oams3WUltZ0FaVzFlUFdNbDNOK2NpU29lTjFhay91OVluZGJ2WEl4RHZF?=
 =?utf-8?B?elRhK2tGZGVQRVdocVNxUFhpRmhSQ053dnpjMDI5cnE5SlFoU1Mrc1crTEhQ?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gi4DtGPCx7vxPTyunF4QNCdN4tx40wqogR7SR8ieupsQdJz9YNlu7WA9Ewa0GXLSKO3UbUFdNVrgKGXkBmtUxbpXmU0rjdG0CCpMJgPESjD4wMBdFcG0PZLRZDe5q5T5oegdlxP8im2IVHYJALr/nQWxt8q1euekFFE+vCy97ZONwu5cnz7lWh+1ncCKPMPyPk9BdA+wBXbZ5pfh6k6k4P4v2kESEYRlZ+crM+j9TaFX78701/vcJhhOBtiOLqGmr39Gph7BPvbHVBJWgmL06IbD3JO+xg1PPZK9OkqfvFMMJVZYC0YnVOSHuCu9ErBRnUMxePLf0BbJAQk3XB7k50jew6eNl/+V640LtoB13Wfb24D8qvttTG7JBZQjWt2AqdQmLmhk6nJOHXXslkaWD4DZsTvszzk63HawXEcl40FgG24rM3aFmJ5awaXw9hpYNpQ5csjN6N+ODocpD+moiAoRz+xemW/Vt9G1rJmp6V8mOOwA46NTlEMJcQ87TLkONL5HINvr650o/xoBc6bDsB0ZVaKj77uUDdueCdrmKcXOs8LWVjGqXJK211O6gri1v91hFj/S3jHvZn3ZT1S+a+WK2QHvvDrhSK5koIm6UXK2s1bghbkQ27mi1w90ygxl7TZPdC8aa8MMiMMGkKkzXyTXzi6Nkdlr5ksIsRkS+2n0mjwge9iKwdrl/86o2DzUTj2WH0HhS+3ietJanAanFAPvAyVdUMTrezxoxILl42kncKsy3lQAHGLatIVsxD0HDOGye1gmNpp+GTb7ZbhZlSrdUIU6JpexFCqwTHjvc9A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e84f7d-7c30-4556-dd82-08db1e38171c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 11:44:06.0951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRsjGAVRBRmXm9fr7dpwW5CohlZfNb8LcomQHK65VlFzdldQAN0v5gayyfb2LCzCtJQoj4KoBhek0mv3PIU6gWWvNkvs5jmTlB3dmOaZmv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5239

On 06/03/2023 7:28 am, Jan Beulich wrote:
> On 03.03.2023 16:56, Andrew Cooper wrote:
>> Two python bugfixes which definitely qualify for backport:
>>
>> 897257ba49d0 tools/python: change 's#' size type for Python >= 3.10
>> 3a59443c1d5a tools/xenmon: Fix xenmon.py for with python3.x
> Queued. I wasn't entirely certain about these when I saw them going in.
> They also had no Fixes: tags.

In both cases, they're requirements added by an external party after the
code was in our tree, so there are no obvious fixes tags.

The first patch is really "support compiling with Python 3.10", while
the second is arguably a bug in Xen 4.10(?) when declared full Python 3
support.

>> Next, I'm going to argue for taking:
>>
>> f7d07619d2ae x86/vmx: implement VMExit based guest Bus Lock detection
>> d329b37d1213 x86/vmx: introduce helper to set VMX_INTR_SHADOW_NMI
>> 573279cde1c4 x86/vmx: implement Notify VM Exit
>> 5f08bc9404c7 x86/vmx: Partially revert "x86/vmx: implement Notify VM Exit"
>>
>> These are technically new features for Sapphire Rapids, but they're both
>> very simple (in the grand scheme of new features), and are both
>> mitigations to system-wide denial of services that required silicon
>> changes to make happen.
>>
>> Either way, there is a security argument to be made for backporting these.
> I have to admit I'm not entirely certain here. At present my inclination
> would be to put them in 4.17 only, where - it only going to be 4.17.1 -
> the "new feature" aspect is more reasonable to accept. 4.16, otoh, is
> relatively soon to go out of general support (albeit I notice not yet
> after the next stable release, as this time round the 4 month cadence
> was followed pretty closely). Thoughts?

Bus Lock detection is a "simple" DoS mitigation.  The system continues
to function in presence of a rogue core generating buslocks as fast as
possible.  So this is (ultimately) a nice-to-have.

Notify Exit is different.  It is intended to mitigate pipeline infinite
loops - two we've issued an XSA for, but the PCI Passthrough one that
has no mitigation other than this.

The further we backport Notify Exit, the more we shrink the affected
versions on a theoretical future pipeline infinite loop.  (Marginally,
perhaps, but its still a good start.)


So putting them into 4.17 is definitely an improvement over only being
in 4.18.

But I think if we do get a new pipeline infinite loop issue in the
future, I'll be backporting Notify Exit as a prerequisite on all
security branches that don't currently have it.

~Andrew

