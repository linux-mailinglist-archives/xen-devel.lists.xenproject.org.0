Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4026D04C4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 14:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516697.801246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrRm-00085o-BD; Thu, 30 Mar 2023 12:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516697.801246; Thu, 30 Mar 2023 12:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrRm-00082w-73; Thu, 30 Mar 2023 12:32:06 +0000
Received: by outflank-mailman (input) for mailman id 516697;
 Thu, 30 Mar 2023 12:32:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVKM=7W=citrix.com=prvs=44691dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phrRl-00082q-6S
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 12:32:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df2674d0-cef6-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 14:32:03 +0200 (CEST)
Received: from mail-bn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 08:31:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7103.namprd03.prod.outlook.com (2603:10b6:a03:4e7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 12:31:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 12:31:56 +0000
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
X-Inumbo-ID: df2674d0-cef6-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680179522;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kZQ9SNMA2Pk37zcwa09V7HLcuuHpJQzjgyIPGp3eIIw=;
  b=A98PIwX3qgyIpFXqfgVWKw1NKfRgGolo22xf2Y6WvF57QG26GI1+8v5R
   mSjKfn2FFJMFWeA/TkhQeQLQ6ufuXGohMQBDvdFGQiP+5bo+id1/108+Q
   0aegFOJbO3v8dfqxCL4oYUlqyK6vw6dAt8DLDQVUTplAQ1lqab+4aTPdw
   c=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 103699424
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aje4IaoyoekNrPtSdr8FA5ZzKkVeBmI6ZBIvgKrLsJaIsI4StFCzt
 garIBnTOPrYNjH3eYokYIy3pxgB7cCAyYJqGVdl+C43QX4U8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzCFNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABocTgKAu+2U+paQUtlTu88SF/bXO5xK7xmMzRmBZRonabbqZv2QoPV+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeGrbIW9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgraA70QHJmgT/DjUOcn+8o9zjgHWgAdRgD
 RdM6w1/vfAtoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2hBSWSN9mSPSxloetRW62x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:afC3uaOKsX6pJ8BcTvKjsMiBIKoaSvp037B87TEJdfU1SL38qy
 jN9M5w6faQslsssR4b9exoVJPufZq+z+8W3WByB9eftVLdyQ2VxehZhOOI/9SHIUPDH4VmpM
 RdmsZFaeEZojJB/L7HCKXTKadF/DEnmprY4tvj8w==
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103699424"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APz5MwRm+HOF0z1iyDxL71aUvCwMUVStVyZropj/Z+PWLh6jAuA2lqFXWALGwuDFeFdwK9uHYSOZC3+VPqpF1BlVszb41IzPL9rgIWHeQz8EaKRtYj7Pf4qpIEl2gl3q31su0k4XkdGhy+RKuPJVORSL/XM31UhSTg19KpiD+cML7vb3obowPDZtF2iTwt+439VM3AJLPyw1KpnMlppjfUw0OOMUT00rJy3C7N4FwJJTotFdDI+677oTUWwZ8vB0e3xF3SbKZXy6t0WbmTpJ6dqHw1203Cods6ekMXXaQhPkkwtOrGJr6qLq1rtOVQaszqzJs4acCzOidPe0k2rq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTizeSJO+9kOn1+n68Y6N1srWTuUSBn9DfwkGrvQPng=;
 b=ZquVZie8KASDhCz4djdTbzcIJ/9sdP8uxMstGUTTwVzK7rD/DjMaJM57l5rDXv64DUFy/l1Uig914zDWpXexFsosyhUkHcvTmi2kUf4AnG96FADB9H58o03GVBD25TmAdEZGRm48qv9ZlLIu8FfEO6whFFx10s2n7HDRPLdRgB5iArmh/DJU01HqaQl3n24nh01XeTtkFV3h3sYn6pJR6CPhYfBSakCoTmxKBCS0wcwU+9hdBflIYwETMtc9CweGkMue8SyliAr+7pKCRbsWTq8Uj9WMUsWdJbx2ximlrKtESA3UmqU2IhED/SgG4xcN51bJjcQQq/3MxeKXmElNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTizeSJO+9kOn1+n68Y6N1srWTuUSBn9DfwkGrvQPng=;
 b=THLLQyHKkWQjDw0s6QskTLIq5ElRmWOUEkRGi3STIAGV1hJxlIdpbjnPUVyZ41gQBRlEKHl9cA0DBy8oUM7ivSPgNEwTp8Mzed7CXEU4Pu3hNxiXEk80LsVWDaFylQpmgYWJmsBOBQf+gbgnHfyNGShR6xxplwasJ4U9MrglRH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cbacbc0b-60a0-35ea-c813-e4d620f6406c@citrix.com>
Date: Thu, 30 Mar 2023 13:31:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 9/9] RFC: Everything else
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-10-andrew.cooper3@citrix.com>
 <758615c4-bee6-32fd-0475-0c3c3bb7debe@suse.com>
 <8b368b4d-8a10-eb82-f7cb-d20e406ed285@citrix.com>
 <7cc9be8c-5628-1d19-077b-a70472c9095d@suse.com>
In-Reply-To: <7cc9be8c-5628-1d19-077b-a70472c9095d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0008.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: be106e83-2a44-4bab-7e38-08db311abfbb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yphUDpRAIcKz8jglE9blxPwd/UyLVTIkfVRDfLhgPRnEg23jJyy2fn0BeQ5VfO/Dj6HT7au6nGXAVz5JeYpKYew/vGed0Iw5OudQgRwkczIZoxonNcywfZJ1ebtGg9Go128SWAGgkhcKcCna9I0q8iWmjw5wt+l4jRK7zjDay2hCXGU6ay+I96+Sw+KtKmm8t59TaBpAYjdDEWWZ2nRSgHO9oyJaPW2BCQYE4yxZ0ghXqLv9w/IWmbAvwGSXYqIB6sumEyCdvtyaU5T7Y12yWeY7WmBjjWoHEBL8W0mrVAFyib3LOo7jwrrAok3vh8nCw6N+uRtt/1KUgn4+yoXsPLkxoqXTFKQMuphXveJSyK9DPK5QaUvTXxGbc3NB/6ner6bhK3gQCZOi/qbSTErgLWdLWq+eVAAygtjcGC6sQRAv2rZmGiV7n22CSnd0QEyzPYM4qzEhj+Zgun0kbdsOKlGKqt7+0WGQsKBqrrom8N7uT65mNGq1qVmdAtdoTxWsfvTI6cutqU+UalK4WjqPg5BSeBK5wr7QHyZXbIDfYwKudsMIgG8Kxjue5Rje7dqgeyI6AgEpGaX9xW8yu4FD4cEAJRijNEEcrTSJzPtWKcX/aR7Udm45WTzK5ghHFlbsuIwrL6siDoiHnUmO0WjXCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199021)(38100700002)(36756003)(31696002)(86362001)(6666004)(8936002)(83380400001)(2616005)(41300700001)(478600001)(5660300002)(186003)(316002)(4326008)(8676002)(66556008)(53546011)(6506007)(66476007)(6916009)(6512007)(66946007)(54906003)(31686004)(26005)(82960400001)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enBEaFRTNzVIVVJKaVN1N09mRWtuYVRWTWNjcHJxN3VEZmhBTWVKeHZSbjV3?=
 =?utf-8?B?OUVLanlKUCszN2JTVGd4dmdEUG0xb3RPbFZpMFlwVTNJZHc2UldGU01BNFJ4?=
 =?utf-8?B?VXRuZTFWZ3ptNGNLRjRvSFE5cWNNaHNrQ0tUeEJDc0krL0NEbjYzWFBtYnZK?=
 =?utf-8?B?Mkw5MnVDckNmd2NVakQvbG15TTZmYlRiUkFDbnpKRGIvcEk1SmJ2cmNCUHc4?=
 =?utf-8?B?dUlBWlQrUkxFbmhDVGI3L21UNkZBQzY4alRlRXdKNTNkRHhkTHhZYVlFNXp0?=
 =?utf-8?B?ell3WjNZWC9TZ1pXUkVyUW13RjVyMmFvYVFCUXIzRjBKOVJ0cG5EMG5nZWtk?=
 =?utf-8?B?Y3dzL1IvRkt4dXFOYXRPQlM4TUQ3RGZJZXlSWnFxM3ZyekFCcGVGWjBONnhD?=
 =?utf-8?B?UXhCVGhIY1RCNC8yVnkraWdmMzVsVEpVN3V1RjdhcWlkbEpUOXFHSGlTOEY1?=
 =?utf-8?B?U1JvMitycWxRVGpIaFRvdFNqaVA1WUY4M1VXOWRwdEpBNUhQalZaZ1p5eTcv?=
 =?utf-8?B?dTNBODFEdVB0ZVZQcWhmbm9wb1UxUnRrLzBueDEzQzF6OE45NHliQWh2ZXRl?=
 =?utf-8?B?UGxhcytWRis1Um0raFpnWktpZ1JmQnJkYkZuUjB3VjlaajI2RGVrV2EzQmc1?=
 =?utf-8?B?Tk1yYjRRSDd2Z2xCbXlucGdkZS9VUTdXZ3NvUGR2T0dZMTlZTWZhVGJIdEFF?=
 =?utf-8?B?Z1Vma1JuN1pmRjVVQVExVWRnNTZOcXFORU9WSHI5cCtPaEtac3pkL0lkZVcv?=
 =?utf-8?B?UnpuVDJ6VlpsaXFRNzhLNFpGM203Ynp2cG5tNXBIamRRYkNJVGRnc1pzdkw2?=
 =?utf-8?B?TVZyaFdndWhmM2tHN0wxbVZMNnR6OFBGeTZCZnF1RWJ1c0dWQ2NqY25HZGdQ?=
 =?utf-8?B?dnVQYWtqSmV4Nm5vK3NEYyt0R1QxQVNud1pTYWVpeGhOemJuUXJHWWJNS2ZO?=
 =?utf-8?B?YVUwV2xXZ0RmQWhaUTF3OGJSWDdtQUZoenZEb0c3dEFmbWl2QVB4UGNqNDdo?=
 =?utf-8?B?UlhDYkFsd2x4a1hYNjJHb0RNa3dxUm02cHRhcUk5VnUzSUp5THVWWVJ0RjJ4?=
 =?utf-8?B?MlNreW5jdW5jMDJVMllMcVZPekFNd2dxaUM1TlZ3bno4d1FCWTgzbHQwNFRv?=
 =?utf-8?B?d0lEOW4rQUJxZEQ2UXhKODZ2bzUrODEvNHIzSUxoWjNPRkg0Z3YvRGFRdkVI?=
 =?utf-8?B?cURRT20wVVV2WWx3L1A5RDd4bmFqUmhZZkthZjl4Z2UycWdRd2JwajZSTGF0?=
 =?utf-8?B?dUdQRVdHeFBYMFRDc2xLVUlpYUpOUm5Iejk3L0VXSVBLQ3gvTnRBL0NvT0RD?=
 =?utf-8?B?dFpwRDVTUm5mN0NiWEg5T3gzangzT2FrWHBqVzltN0tWZUNJSlErUUREMmNP?=
 =?utf-8?B?aGxyZ0pXUTZXVnRCeFhRS3NTRHNXNUNjOENkR1dqdVZNaytpc24yMjEzZXI2?=
 =?utf-8?B?eHlnUUtvNGpYZXdqamtqbXhsUGVSWVFnYUNoSjk2MGlsekNMOVU1MXlBY3NB?=
 =?utf-8?B?dG1uUERwR29vazZzWStiZkZRSkUzOUd2eXdEclQxZ0hENG8yN05HU1hlM3Iy?=
 =?utf-8?B?b2tNV1VmZDdNbFZOU2JPOEVhN2tlWmp0bzFOV2lKdnF4dVNkeUxpWi9BK0FL?=
 =?utf-8?B?WkxxRjAvV2lUT2hqUWtaVzR2NlRJdVk5amgzRnZ6Ny9KY0U4NE9VbnZPMndH?=
 =?utf-8?B?Y1VSNGNaZlA4Mlp3MmlsVXQ5NjZHYVRuYVUzdUpteWhWelZSM21XRXhrbFdq?=
 =?utf-8?B?TDZld1ZwQ1M2QWM0MEtqb3Z2aTR2SjZEZTFHME9VMTFTTlc3THNCUEZoRmFS?=
 =?utf-8?B?WDl1WnpOK20zbHF4K3J6Q1JNakY1V3E4bXd0c2tJOTduVEZtUEsxa0VGUmdG?=
 =?utf-8?B?NEdHMm1yMnBaNzlCZFhISXdseW00RHlQdzZyeHJoYjJ6ZUtyR0Ewblc4Nnoz?=
 =?utf-8?B?SFZDOWNkYk91UGoxRm9MbnJydTVLZnVhMEtpVUtrdStUSUZxTXpBdUlCYWt1?=
 =?utf-8?B?ZkVwMVB0TTA2N0tZVi91azh4bVdsbUZpMmFwRHRYZFVTU3hjUDNqM2RLbnZa?=
 =?utf-8?B?SnFZRnhacHpoeFpMM3hOb240WXRrNWRxYkd0aSsydHliSk05WVR4ell6KzVm?=
 =?utf-8?B?UEh0bDdadXdoYWQ1YzZBS2RCNW9Ja1FvZGx2QiswbHg1WW43aHczeXpvYkRV?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GLH+DcmAACmw/XrJYZOZ7ItBAeSqnFnYmOWkxqI+Nz5bKhBMlmZPWQA4omAIIBVrUepruidobzH1exqTIc5YsGhs3qCobWaYsMguj0s8aY+mkSiTc0OfJqjWfiOJ8Jole+OGlglUFdaacNnSSYmkKX5LcOzBwyOaIUksh5Hr//5L4ffCDj5SfzQMr0tPF7buc9OTfY4WWv7hvtW95qAPD1PcGyV7T7D4kAcKmrEnI2KzQTOJJrLPMlmHSIf5qUOz1zkqcyExrefMV7NICQGyENlzSjciBxkhUwByqGi8A+VqE8e0iQ58O2zEaymXuR8H8Yiy7LPZwuG0RCLLlzdQ3qEmGOdtGuFfEIt8fYGpgHYuHbk0DkAFeh2jLTEqg0/NbZc60TG7Sz9VBDJFIKPrmwpjGK0qydyP0SYVdJS7I6qQf3T4XdbkoF7rguO7rKgWSib13nw92ORlk2ajXT8PgeJARH9Bs3i8WSoobBRrtxZiVF9WIj6TilqUofDltraz1IB8AWNbC7eHogzFyRO8u5a9jFQLAMqfOPSeV+/C1Jb1+Rt28KqVw4osWOCMwzjBPre16S7pg8Nf7b0pXAQbdItBJLdCxAoAv2eAcPGQQ3zRsZwccUbQgfNSto2yi1kaMWV48cc8yk3ZUYu08fUAHLH1kF8/v8SVOMVsiyW5L77qW6Bis9DOOFfQHCd/mRzxEOzF/9Loi+yTcirDo4AX6K7wjwB04RaAvKDY/7TnvNXsCY8COUzZ9lcTk+JIBGtA73+FJPK+Q/YvF8NAC3SKPJyazn5zP0ROQ8n/uA8KS43uCcp9QehJG5dVapphXRcN1EjTJ0LZVDGPtcahuo7zAA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be106e83-2a44-4bab-7e38-08db311abfbb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 12:31:56.1988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6iYRcYWDON5KqIB6wUCdTv4xMJi1z1UKtm2VTcYBTGMo7frqh0+bBRShOVUmJ1AAEKzsWfkkLe77oMcN3tCFreaiuQmQPQ1TWMdTfh191g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7103

On 30/03/2023 1:06 pm, Jan Beulich wrote:
> On 30.03.2023 14:01, Andrew Cooper wrote:
>> On 30/03/2023 11:16 am, Jan Beulich wrote:
>>>> --- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
>>>> +++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
>>>> @@ -893,7 +893,7 @@ int LLVMFuzzerTestOneInput(const uint8_t *data_p, size_t size)
>>>>      struct x86_emulate_ctxt ctxt = {
>>>>          .data = &state,
>>>>          .regs = &input.regs,
>>>> -        .cpuid = &cp,
>>>> +        .cpu_policy = &cp,
>>> ... this and ...
>>>
>>>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>>>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>>>> @@ -909,7 +909,7 @@ int main(int argc, char **argv)
>>>>  
>>>>      ctxt.regs = &regs;
>>>>      ctxt.force_writeback = 0;
>>>> -    ctxt.cpuid     = &cp;
>>>> +    ctxt.cpu_policy = &cp;
>>> ... this imo want keeping as you have it here.
>> Ok, so that's a firm "switch to using cpu_policy for emul_ctxt" then.
>>
>> Which is fine - in fact it's one I'd already started splitting out of
>> this patch.
> Hmm, wait - CPUID "basic" and "feat" and alike uses I still would prefer
> to see using "cpuid". It's really only such initializers which (imo
> even logically) want to use the name with the wider coverage.

So its the other way around and you're saying you don't want the field
name to change, and you don't want to see

-#define vcpu_has_fpu()         (ctxt->cpuid->basic.fpu)
+#define vcpu_has_fpu()         (ctxt->cpu_policy->basic.fpu)

in the resulting diff ?

~Andrew

