Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040F6C66DA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 12:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513807.795378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJJe-0006YM-F6; Thu, 23 Mar 2023 11:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513807.795378; Thu, 23 Mar 2023 11:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJJe-0006W0-BA; Thu, 23 Mar 2023 11:41:10 +0000
Received: by outflank-mailman (input) for mailman id 513807;
 Thu, 23 Mar 2023 11:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfJJd-0006Vu-5z
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 11:41:09 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96987bfb-c96f-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 12:41:05 +0100 (CET)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 07:40:56 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5089.namprd03.prod.outlook.com (2603:10b6:408:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 11:40:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 11:40:42 +0000
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
X-Inumbo-ID: 96987bfb-c96f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679571665;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wrRBXu4m7ZchmTzpx+LgntVE4Aqjx54Em/4mDv3IXhg=;
  b=NgnQhK93tnL3vW5BwHO/H9soVkapLlFNTUq3LoScMcr5KgL44ySSCtvH
   yVRQl59vLCHGGWezNhh1MBiMdefJeDwxanShYi+YvYb0AhL5jWpCmIvxq
   cDUqb+9B2jyqx3xcPaif1xiKCZCnfpkmSIzjTnRPku6rhFATDhfuHBAWU
   U=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 104423197
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bM3ce6ph7p3Nh9vFprOD4287UGZeBmIpZBIvgKrLsJaIsI4StFCzt
 garIBnXbqneZjP0KNkiadu18k5XupSDyt9mGwJv+Sw9FioX8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSJNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABE3VC2J37KY+4m6ddVDmP0HMfLNLZxK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIG9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqqIw2wTCmQT/DjUzVgvqhdCV1XW9XtZfA
 E5N5BgJ7qsboRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSy2ETgYKykFfyBsZRcE5vHzrYd1iQjAJuuPC4awh9zxXDTvm
 TaDqXFkg61J1ZJQkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshXZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:+J31ra2ml2e51HwF68eaiQqjBKMkLtp133Aq2lEZdPU1SKGlfq
 WV954mPHDP+VUssQ4b6LK90cW7L080lqQY3WByB9eftWDd0QOVxepZgrcKrQeAJ8T2zJ856Z
 td
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="104423197"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CE9AC5rOhlTuu5zO4QBCjgat4XoO3DEOUwBiTGb+ZHi4yXFYUCSyyU3EicZaGaEnVNBNlqQ8idTcaCRxWtZ2kRpntxphhvxncbYah8wcq8xooyKvLt1y1jVG58DMV2epj2lb5jFQqsBK+BMwz/e3pK273ohBx4UTqhqmd1rjlAtuwI0y99AE/n2Rqcbx4I0/xts+rKp3OxHYP4rwMSh4v0LbW5b2nzBBCEu7yU9Zgz3sddL0smzdAUExFOdcvsvcS7ePYY10Td6SARFQQARJS48VGCPXSAmNGMaX674dOhJvvdKJz9aV9vvTIXaSTofwYGb6Fpd4rGEaGlC7cSVd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrRBXu4m7ZchmTzpx+LgntVE4Aqjx54Em/4mDv3IXhg=;
 b=OsZSCj8YpsfJd7PIeOgmJEf1/hLgBIJGANMNcr2bHTItFPUNZk9ep86/ATinUHTPmtS48d9WATlNQAfQNMK14rFktp4jjl49IyirZaNuGKH9Q7fcJw7r366Q7NLYoXHEDtnnA0b77TdmjbWxfnl5/gR3FnttiMQobs24TikMHiI7G/ZggMyv2lftYo5M3xywAcFQ2GtJVeocH/1+2EoifCICIC0rr/kPTYsL6LNdzSUDF8oIyfDojeULOW9d5tVhO388D6EjKcCOJwbp//BLcSpxe+7DBNmirvPdp6oCE5d7OyT4FoO47tJSP/4xQ+JKIf8jspVdwf+oQ+cGDmjwDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrRBXu4m7ZchmTzpx+LgntVE4Aqjx54Em/4mDv3IXhg=;
 b=INnTSkm6Nd6ZfTiI+eDNRr5Qt5yUKINOsdfTyBEtVhQ7/wJwFQvXPFeJQ5SStvSnbc9/RtO0XajTZteTXlstS9V+a5u0UNIjutAPwKL0rD+JEEgWBo9b2Qs7pBCxW8UBGtXQKdLiddHmDVSsdbFTMASBoJqmY/KnBHPJ3xKfpoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d80e3888-a030-88c5-d3bc-018035f910d8@citrix.com>
Date: Thu, 23 Mar 2023 11:40:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 00/16] x86: assorted (mostly) shadow mode adjustments
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f5c147-5cd2-4a31-7360-08db2b936e58
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z2yAURH1Z1dUb33BeWmPrkbkNKhCWZEg9DAAH9vhvLGqZ0XlcNI1UUT+pJRP4LSfJyiQP0Qc3QZeEy6kScm1CeLVlJ2eIJXtRuPFbfZ/9wxpkAvxmo4UuldkwIkNMpQOedTLoK8YFem7ZFdl9AOcYsn4HYjJsMds2iBS+ttzGOD6apxys3RTDJ42aq0MP3lBwRRd2Wx5rxwJRoVPLpwdSdoST/HwrQQwrm4IVH1stCYqtxGeFSqNbcCLx8YEsM6wSs/aYKYnZzC+HMWx91y9f68P9wIHSFpywu+eRwpUt0lEBdqRP8ivYj5BQww+fdAj9oY8QWLhGJUAiDsvLX5pGl7Er8Awvrs3U3IHB///wyCDOe2ljmdsbe/8kSx8la8CGg5V2u+4raJ1hlNpcPljqsZsHHPz/Treigt23dNxdmIoABQIjSBlafVg8YMag2zjFle9g3L1bpj4To02c7oDXFs2zx2bxJ0jx/95Ll1BNCPdhlBaYZK781guhS3o/c9DkUUzBMxVl4KGmt5/5FJqqL68fPICOH3/cvw1Oi3cgeOU7g/fCwhWwxwKBxIqoGQarrMcYZXMFmFH0N3If7EKmi2VTdfbbmyEqOZiw7VWMhxz5gJz0UymxYTcq04rtAj2iy5NbhoDUJAkYFjkOYUHo78uacroA58YxpwpPtjp9EY2UuE9z2nVIxN80N/hCwahTtL2289pm8Mus5lorABOhlRZZbQCOKzcWqkTdkhe4BU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199018)(31686004)(38100700002)(2906002)(83380400001)(478600001)(6486002)(2616005)(186003)(86362001)(31696002)(36756003)(316002)(110136005)(54906003)(66476007)(8676002)(66556008)(66946007)(4326008)(8936002)(6666004)(53546011)(26005)(6512007)(6506007)(5660300002)(41300700001)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkRHc1FreEZhNDl3QlRTdkV0QzV3dWNOeFFIK3dEZ3JPSlF2ZzBFUzArZG1r?=
 =?utf-8?B?UFA5RjR4RHlqTmxQbFBtQzZBV09MdFd1Rk1Wd0tyUGN5L1M1SG9tcnVHR2Fn?=
 =?utf-8?B?LzRlT2xMNm82ZHZjcVFXYWpveURkNHBlUXVzbVFWeFlwUDJab2dpUTl3R05i?=
 =?utf-8?B?SElVSnU3UW1JekEvK3V3ek5pOHdTZUhNRHJsZzg1Y3RMNzNLNUpXVDNXSU1s?=
 =?utf-8?B?b1EzRURsSkdqd0ZxTDJ3SHFGZ3BrbWJyT0xWckJpbUtmYytlR2Z2bCtETFND?=
 =?utf-8?B?SENsUTJCV0JydXhUTG9NSGFKcWc2ZFlyWmZRRW9aNG5uOUpxcUhxUmduVllS?=
 =?utf-8?B?VXdqTXVnN1diOWVhS2dnZCtSYXpqODJldXViY1Y2YUYrREVaMDBXZEdhNzB0?=
 =?utf-8?B?QjZZNEIwVXR4S3NQNGhXQ2ZlWHVCL1VlVG5BN0pQcTRLbktXRWZKdTB1Q1U4?=
 =?utf-8?B?dUw2RE5WM0VvcHJxb09yVjViSWJ3QkRwVFRUWEgxMVBiSk5CQ28zSWk2RFNl?=
 =?utf-8?B?QXc0QTZvclFra01CemowTVVUUmlzanpia3RXK1BqalJBOXRVbFo1WkNIWjdW?=
 =?utf-8?B?cVlIdFBHS2xzMys1N204Ukc5aklZMXJHODVML2xBOENyd0J3NkJ2c3g4MG1G?=
 =?utf-8?B?c3ZCVGRsUjQ4bS9TSlJJR2NKdXQ2S1gzYU9nMFNJM3JNWUF4VmtWNCtLWEY4?=
 =?utf-8?B?bzZwUFJNNm1BT1Q5VDhzNnhTZ05sdVliRlVSakRBNVNsVFJUV3ptbDJORXBv?=
 =?utf-8?B?U0NnYnZMbkk0Rk41dk1IL3hpUUpmSkFiN3VpRU1SSmw4TzIzYTV3cTFhMUZm?=
 =?utf-8?B?Vms5aldwWnJYTTdhWnk0NGJOd0RvSHZmMTJHWFIwZnR3NFJYdlU4YjczWEZT?=
 =?utf-8?B?YjdTT2thS1BOSDBOamlxQkhGMWZlZVJjbUo5eUVhc0lLa0tvRlZEVDNUSndt?=
 =?utf-8?B?dm5VaGNBSlpHM3pCVkZsM0RwbVRIeFNFZnZ2bTQzaHcyQ2ZmK01RUWpBSDdP?=
 =?utf-8?B?cU9GeEdDbXJuSzM4U2FJVEhOSjVIUmE0aExIQ3lISlRTL1hmc0pmK083U1Vy?=
 =?utf-8?B?TW5pRk5vTVZPWGxSaEVkdEJOYzhSbkJsMFpoOUtRb0RyS211RytjdDJtZWw4?=
 =?utf-8?B?a2RhdDB1OXM4TDVDMEdHdXNCeTRiQVgxN2QxTVM1WndSdUlBS24xMWdMb2Fs?=
 =?utf-8?B?eFFYNkYwNGZCS2RSa2dZU3JIajFPdWZMWVNTeDVJa09oekh3Q3ZyaUpBYVhm?=
 =?utf-8?B?UmxQaUpreG9sTEtCYUJVTC9GYUZmYS9Tb1ZWMUtDRjEzenkvVHpnUE1pQWRi?=
 =?utf-8?B?aDZQdUhQL1VXVHRzTTRvUWo4VldIMTB4S0hqckN1YUJrYmREbnZuN0xZRktm?=
 =?utf-8?B?bkY5WEkzOUdqUzFXQytvUllsU211ME4veStLTER3UExoeE90NXpwbkxVNFUv?=
 =?utf-8?B?ZTBhbTRUZ0tmZDAzN0l6VE9NalpxazVsRFp3UkM4dndYWk5sbWN4aTdFdWY3?=
 =?utf-8?B?eW9PRGhudTEwVjB6VHV3anRGaDBVNXJWd0xZbzR6bTcrVHd0S1VoNms2UUlF?=
 =?utf-8?B?d1U4Mm4rWjVDaSs0YjBmOW8yTWZob0MrNC85T2tYVEVvbXh1VENxMmhNSloy?=
 =?utf-8?B?SWZUSWtDcGtwWHl5U21PcmJ2a0ErUjduZW1ZR09TTnlYNnJzZ3FIWmw5eUpK?=
 =?utf-8?B?Mkd2RlpQVnJpM0pBWG13RS8vcFZzdmJFdWJGeUdtRUExOUdLVkV3WTZtM0hJ?=
 =?utf-8?B?VVMyY09tOU10dG1LeXdiZXkrTnVDRE9IVHk1SmZKWkZ0WlgvcFdFV1prNFRa?=
 =?utf-8?B?aEJBL0dpMDJ3NWh6OFFDQVQ0dnFBbWJCblkvWFpBc3pieW51RXNqY1cyd0pK?=
 =?utf-8?B?dXd3Z0NsWThzT0NsL0pPeEppbmlva1VkZ29hQys2eWRNWkYxNjVRNi9zUUlS?=
 =?utf-8?B?NkowL1ZRQitoL0xpb2llWEFrUkZnN2YxM0wzdzZwRHE3WW92T2xHL21rNjFw?=
 =?utf-8?B?VUhvcS81ZzJYS094UUtnbC92N0NRQ3NkdncrY0hDSldlOU9ka3hBSlNXSXFQ?=
 =?utf-8?B?bGFSWkhxaHpLdE1PeHgraVB4cFVTMU9QNTd6RFo0NmJGZmcrTmZ1WW0xbGwy?=
 =?utf-8?B?d0JXL1VYU01aaFkzZGhtaUtwV0RPUllYd0lwaTNURFJYYjhreWplUi9JeHpm?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7sJUCjiE0bk0N5qx4XTJqbmrN7eldOZ3jQCriYR7RWJfrUuWTIumR7AxOFI7N4VPMk7so7z7zcOcDGThQmrPIxw/uN9t2zJTBWPpciFry99VTl/3MahOQSbtVg8t+/+bq12/Y7e9jWhy1OgZtP47qlkaxjjrgpORwL56wMmrgK8f1etwOxoLDPEz0WrFES2ig2TIskCxrGjPMk7iFkMbMeP5Bx1ZMypFd9rHtB1bGEDTo52YmmqQOYitUZQTIwo7aA1O85DcHQUJnixyiXEcXNgqXjv5J/55nk1iGOxxcJw7SvFHnZJopENduyf4aXjwi0iMHSrlHIW7GMf1mFxwLEdAiqqALooQ8b21842z34TaUaiqKIwSzrcnzMe2ceSQpgqMV2xOM4wH1KUh5wbQ9aPwsD7mgUDXnQ0XYfM4LhYHVTgz69pp9g7OsmJwY0IFiYa0ABkyf+2d32045jaVSOLDxEoBSQBYQzPpGQirnKjxwvmAGb3NqoGq8uFvZQZXVzNjunXQ4QONIrwEdpsNmMWIZxAinAfFs4TcZqlzkxcIkiTDWPKf7SEOvclOpxOvUCsYUaWkSAPzJ/vxd4a3mJoyt7Tn683KTKVK5x+5/D96vtYUQj5o0QVWw9HDIx5uhe2cLyTtLAQ9VjP2Hj06twr6S81uZaS0gvjhzvcZSWafRM8lVBhvvY+vwAE+CN7JHK/3ASRZWVLnGnHSASKOJnbmfSGYwtrELc3DvN/G6Orfol/7bmiRA1Ycv+LMM2gt4cvJLbuaTvFri84KGfythyK53hA9cp+cxhU+ZL6D/LoJTNRUlxMVMZdmvIEka+UpskX8trfH2o3AF6os6EuqRg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f5c147-5cd2-4a31-7360-08db2b936e58
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 11:40:41.7190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVLquM3VkrU2HLhUtBmAjJLVFeLMH+Y1UAw6/GnqapLK8VNsAvZUQznFyFqzF3a8EyevNSq1FyRZgdvHupYN/U/Cnvy5Ga3asLEHjZqCgz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5089

On 22/03/2023 9:28 am, Jan Beulich wrote:
> This is kind of fallout from XSA-427 investigations, partly related to
> there having been a more intrusive first approach. This is also the
> reason why one of the patch has R-b already - that was a prereq for
> the original approach.
>
> Most patches aren't really dependent upon one another, so can probably
> go in independently (as they get acked).
>
> 01: shadow: fix and improve sh_page_has_multiple_shadows()
> 02: shadow: fold/rename sh_unhook_*_mappings()
> 03: shadow: drop redundant present bit checks from SHADOW_FOREACH_L<N>E() "bodys"
> 04: shadow: replace memcmp() in sh_resync_l1()
> 05: shadow: reduce explicit log-dirty recording for HVM
> 06: shadow: purge {write,cmpxchg}_guest_entry() hooks
> 07: shadow: call sh_update_cr3() directly sh_page_fault()
> 08: shadow: use lighter weight mode checks
> 09: shadow: OOS mode is HVM-only
> 10: shadow: move OOS functions to their own file
> 11: shadow: drop is_hvm_...() where easily possible
> 12: shadow: make monitor table create/destroy more consistent
> 13: shadow: vCPU-s never have "no mode"
> 14: shadow: "monitor table" is a HVM-only concept
> 15: shadow: adjust monitor table prealloc amount
> 16: PV: conditionalize arch_set_info_guest()'s call to update_cr3()

Out of interest, I looked at the net delta from this, and it's quite
interesting.

For data:
add/remove: 0/0 grow/shrink: 1/7 up/down: 8/-112 (-104)
__func__                                    2986    2994      +8
sh_paging_mode__guest_4                       96      80     -16
...

which is nice all around.  (Shame that __func__ is being merged
everywhere but oh well.)

For code, two notable exerts:
add/remove: 6/5 grow/shrink: 5/39 up/down: 1549/-3499 (-1950)
Function                                     old     new   delta
mod_l1_entry                                2120    2008    -112
do_mmu_update                               6548    6209    -339

I can't see any patch which obviously makes that change in one go, so I
can only assume it's combination of various small things.

~Andrew

