Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5517331E5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550169.859104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9EP-0002Ny-Kt; Fri, 16 Jun 2023 13:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550169.859104; Fri, 16 Jun 2023 13:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9EP-0002Gd-Fi; Fri, 16 Jun 2023 13:11:13 +0000
Received: by outflank-mailman (input) for mailman id 550169;
 Fri, 16 Jun 2023 13:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9EO-0001xG-Ed
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:11:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 433aae63-0c47-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 15:11:10 +0200 (CEST)
Received: from mail-sn1nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:11:09 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6547.namprd03.prod.outlook.com (2603:10b6:806:1c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:11:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:11:06 +0000
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
X-Inumbo-ID: 433aae63-0c47-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=teyfxT690T5FSXoOSSniTAsDc/olb8QuZGXjP4dniKc=;
  b=CGKY/AbjWlk+XyFxU2SA4J9cr9q0faEMqQHyrN4F2ANJilXkjP//jx+A
   UfXoDv6Oj3s+TDrc3l7sCmp0mJU67IImw+3aU3e85JBSBdja3bokuptLk
   ln2bGYbbpOWdzdvgOwyqH5Ib/GK+YekeZ3HARtTFsh0R4EUIsWvg7qF3T
   Q=;
X-IronPort-RemoteIP: 104.47.57.48
X-IronPort-MID: 111813013
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:U5Ei5K2/CKI28OF5AfbD5fRwkn2cJEfYwER7XKvMYLTBsI5bp2AHm
 2EfXGqAMvuCNGaneIhxbIm1pxxXvJLRz9NjTVE5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJnO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfOV4Wq
 MZIdT83bR2bu++ckaKrDeh8mZF2RCXrFNt3VnBI6xj8VaxjeraaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6PnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv137+WxnuiA+r+EpWRzaZOkWOf4FU+JycQbV/4pfSn1GWxDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSNrmK2YTzSa7Lj8kN+pES0cLGtHfildSwIAu4PnuNtr0kKJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:NREI+aMvDMppAMBcTgyjsMiBIKoaSvp037BK7SpMoHtuA6mlfq
 GV7ZYmPHDP5Ar5NEtOpTniAtjifZq/z/9ICOAqVN/OYOCPggCVxepZjbcKrQePJ8X/nNQtr5
 uJccJFeaDN5VsRt7eH3OGheexQpOVuaMqT9J/jJ3EGd3AMV4hQqz1XJyy8CUNMSAxPFfMCZe
 GhDpounUvHRZwPBP7Lf0U4Yw==
X-Talos-CUID: 9a23:Nsyf327hWkKfKfBvktsszHFMR/p1L3Lnz3rIH0KSWHZ5D7yFVgrF
X-Talos-MUID: 9a23:pdAEUQpWGMHIQxvb3bMezxhZbON53aiIMW0iq5M+v4qAODIuEDjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="111813013"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUdK0hnCDmbCF7DT+bpunIApCOc7L2nks6ccXDZ5fE8Ex7u57Jni1PRWhZ9GOCttg7+ym9iLqXWEQ+S8xavQuiGFhQmJXjUyhDSJBGrZsGuz2yxiBH8kjzcr4IIycZ88jlFup6Nl6QJV2rZgH4v1YpyyPHGB7KPuHrjNFzcboKJbnbWMn3MJYI7womCAnMlMsqy8lFGxdaXRFQI43Opz53t231JDxJrrvg6ium5JMJBTpDd1hR1Oqe9Fxk9B0KPwB3fOIu0WJW/hjHfRPXieWEQA2nhQag2NBoP6ucs2KeYIFoQP2w8F3KxTJAFKDXdzObsF87wFbFebBjB4x9DDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IprQ04Jt1eHCGLkFgtgI4smULvZWNBrzC5dKiJTVpfU=;
 b=jUiiBMO3XrVEpvq/8n7WEItQyt7zUwF+BjF/SMP2D8W93VJq5G0QimUV6zttXnIRJUb3s3G3aTEaY9fAvAPMlmN1zJkDehBeZDXR/RUL1fzRw02RLcUtYp4tZ2WUxI1pN0hm9TuXlK1UXH0GfycOKE3CwEmdlefC9Jz0GErO/8CO+Es+ETNuylwgxOphbVeNhx403YcrOuo8x6XDDXi6gsMbeCYdlZ3SbGPG8aghaix+/LmDgaA999KZj3VYabiDwbXiPiTyqaNg7JJtvK3y7HrYBp3S02a3T6ANmqPxy2itjWTFMksyQCpYaIFcZpmKXCSp0K543AnK1cT7N2WiqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IprQ04Jt1eHCGLkFgtgI4smULvZWNBrzC5dKiJTVpfU=;
 b=Z8L8B5rYCJxIM04qi+ySteGU4sP9uGmKcHHS3YIsg3LJqVqHQquATAiwpP1y3bjDV07xsNhskkdQ9SIM3wHG+aobe8qGpHhkztt/krR4s01YYz4zPHVRk3gcyYvhEKN6dB87PufClZRfH4k/WW0WwXOTGGwjtrVbHHNt6xiK3/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 02/13] libx86: introduce helper to fetch cpuid leaf
Date: Fri, 16 Jun 2023 15:10:08 +0200
Message-Id: <20230616131019.11476-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b379771-0332-4ea3-6d0d-08db6e6b2514
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lU+kIk3HP5SVfVtTmfWsai23AsV4bHQ9yUB+k7MrpLcrgU7nDDCujlT0p+I7f/n7f7Fk9obU8sDNDisdLBTUutj2g87MFS0uWr1zdNSJt9oCQqoRh3bkM9fU+CqB7O/IV8yARjjnBdva4ERkef6ly9CAzsn/zKGMsOnosdZ3Jf3Caf6rv4WchkeOjstxiYknQAza8804htuhjvqDXEMnGAZ2xOns/Sja6ncZgXBebRrBMNLIKOUlwTSCCG4W41WOqdP9BrO4FPEV8okcG4cs90hRcWQZLza5oMVKfj4MTyfbNFAP46vSF72OUJfcgsvUY0AHHjiwzGTky8mEmAW/+R6nJM38F48+21LbT8oH8V0JDN0IIoRGGOjk9mx63tIBPLfW0tKuCBxvIbFN0s8YSjCxgI0uLMwEOdJ39igr8qBtE3bdZvlVtv44aC3IKJWp/IjagPEz0c0RKqHbWz3RZWIvD42sLKie1u/QLzNcQtYRQ8V7frqcmL1QTyNboG418pEXn0D5PKu7cL/ZQtNCnx7TAwpXyJTEy0+nPmoYzoZwUXpT1brG9A0fdPRFFCR9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(86362001)(38100700002)(8676002)(5660300002)(82960400001)(30864003)(316002)(8936002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(54906003)(83380400001)(2616005)(66899021)(186003)(36756003)(478600001)(107886003)(1076003)(6512007)(6506007)(26005)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGcxamMxT1ZQbXlCMU5JSnJ6WUFvaUppTDRXY2pZNzZZZHhIaUlQRktuenpP?=
 =?utf-8?B?MktxLzJtcWhDU1crSGlORFc5bjVnOWlRanBPYVFDWDZEQTJxSkNyY1B0WC9O?=
 =?utf-8?B?b09rRHhwNVgvMnhhYWZMMWZrM3lvQ2svcktzZkgzTkMwMm4wMmgybUk1ZUhN?=
 =?utf-8?B?S1NadmhDVCtBMjUxdWNQSHlVUlp5UFdhZFUzdEVKTG5FWE83MDJHeUVySm9v?=
 =?utf-8?B?T254bW44S2VJZGVlQlV4cFNKd3dyVXpnZWFKR2pTNEFBWGx3K2JCdUJDREZM?=
 =?utf-8?B?d3hKWXJXYTBJaFVUQ0hVMmFtVGFVWDFBTGFiKy9sNTlURk00Q3RBTzJIY1RL?=
 =?utf-8?B?Q2lqMC96bjVYR05zT0lPTEtjTEEwV1dFNnBZY3IrUkw3TElHcGFYREdrb0ZY?=
 =?utf-8?B?TlNDbXZnVkJKUzU3dFdnT29CbUJYVitWMTd1Q2hTWVQ5NEQxaSt4cjhHeUt2?=
 =?utf-8?B?L3Rzc3Z3VXNRRXlWcWIrSnEvU3FEYkh5cVB6cDFZQkNaRnlQNnlQZVJYRlMz?=
 =?utf-8?B?MFZCY09vYjZtRUtpbjJRMzBIbUNKZmE5TjJQSENIc0s3YlV3cURBbnZoV1J5?=
 =?utf-8?B?aStBeElDQW5WOXI3Q2lkMis4N0p5OUpzd0gvT1hleldzN1VoV1FrVWNjaGhY?=
 =?utf-8?B?a3JaTFhRU2FsYVFyOENCZTF4THcvdlZLSmxURk05emdES3lOeXIwZzVIYTN4?=
 =?utf-8?B?Zm8rVE1hOFViZDYxaVZsOWVidkhKK2xBVkMvY3l0dFdLdUdmT3AyUDJack5j?=
 =?utf-8?B?UHMrSW5lc3AyaldWY1A2NEhwSGZvUnJYTHFpUzFaREFUdGFuRFpGZllNeDR6?=
 =?utf-8?B?NnVsNC9wTkQzYUpEeEoyVVRXcmxwNjBZMDJUVHZ5bCtLanVVTGREeGRYTUZh?=
 =?utf-8?B?QjMzaW12T25Pc29FUnlKcVNWemNMWHFENWZsZHJkdnVhTEN6ckVuYzAvQk4x?=
 =?utf-8?B?aHdhbmw0d1RzZlRKc2I3TkpKUFNZd0FzYWhOejFUUkJrV1B0VVY2Z3VmSklI?=
 =?utf-8?B?K0hleWFDU09yTkdidUxySFpVQ3J5Y1J5UkhYQk01bmtGZXdFdlJZSE9CVkJ1?=
 =?utf-8?B?ZzhnbFgzalBqeS9XTGpKMTJMQkRiRU1JMnAvZUVsWXQzNXdZSUQra0hQeXVk?=
 =?utf-8?B?TkRnSUNPcDNUTzFuUW1pQ21GeVJmUkFNdHM1Tysyb2JJajFxQjRUL24yamxu?=
 =?utf-8?B?cFdSTVhvQm9teTRaUVpoeGtlTUlEYjkycVV1R2FHaURDL29MdjBnVXpGY0tR?=
 =?utf-8?B?c0lFd1prMXkrM3doNzY4a0t2a08zRitRZmIvVVJJWlczeGVXUHRlcUUvaU9I?=
 =?utf-8?B?VHdaWS8zdjhRSGtCUjJwaDU2T3dXWndKVDNxS2Z1ZWxoYkpJS0ttN2k3bDVS?=
 =?utf-8?B?OSsvbFFyRlZjQW5pekVrbFFndVZrQS9NcTltT2o0SkRTNUs3NjJGdHRyUG5O?=
 =?utf-8?B?QkxtT0lBYUdkOTc4VmJjQ0kwNktQUU8rbjB6UVhGZWp1OTR3SHFXb0xpTjRW?=
 =?utf-8?B?Y0VnV0drNGkwVlRIdjE1RDNQQlQ3UXE3VTJHWENCSzZldzdRUUw4K0oxME9s?=
 =?utf-8?B?U2d5RWwxV0JzVjBoUW44Z1FhYVhSUjRGalRMa0dWT2FLUTFtUFNwdmQxclg3?=
 =?utf-8?B?NW80cUpmSUFRbWlrRHNaWSsyN3c1VjZQWFV4UW9iTUFNdkFvUXEyTE1EclRS?=
 =?utf-8?B?eDZvcXo4NVNxMExzUnQ2VFoySTA5K05yTnl0OE1kdEJ3S0htZm05aE5ybWl4?=
 =?utf-8?B?bDd5N2lnY2lpUkI0bjRnOFhzQlp2aDZjaE1jQURBaCtvSGM2aERtRDMyVXdT?=
 =?utf-8?B?Y2VmMlFZTmg3ZStWb3dyVGQvelpoUWhCVG9pWW04bW9ySjZaL2pIK3hxYkpX?=
 =?utf-8?B?V2lXeTVKVG14cm1KbTQ1SXREZ0gxY0NZK3U5VFIwU3hrV09OdHpyK0xUSTFj?=
 =?utf-8?B?SjBsQzE4b0NUbjd6cFNuRTE0V0hEamMrUDU2cEtSdlJxRnhTb2ZPOFpGc2ZW?=
 =?utf-8?B?eG5lVEhOOHRnTWxoWjVZeUlaYTlUYTFrdXJMdm05ZkJ6Z1VKUzRpSDRmc2RP?=
 =?utf-8?B?VGRWVC90T2g3Y2M3bVVienZpdE0vTTNPdVhiOUpCcWpJczB6RlZYMlZDNHRm?=
 =?utf-8?B?ZkE0M1BYOUhrZ09CVU1LQ3NKb3l5Q3ZSUmQvR1JFQWNsblJEcjBMVTdpaWdF?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iNchi3aEL/qSKKfoewOi/eDlMAuq9RXJPp7GUSXhr3WwqKk1HtrollHr9cNgwGSHFzOoRsZRJsiUwUJtXvwZ21puiB/Qp5To4NgnfmL6rdNnRslSluKzRhFb0McZmkYGxoNi+jm14EueexrXCj9YFc3DKeeKr42q6NMksmnjtBQm4/DzjrXIRDJEpB5s8HDwWkSADrsI/2GpQOgO2b0ZQ5eZVzldsy7ytRCbRVJpWWNH1Iko0+vqe9C7AArhPQnVdldwgb+4S4aNJqCg9c4NDFUr0SqhUrj9gOHscQYghsRbdqVb0DQS60EhCqsX0WNJUYqF3+ROeN0YkQAceDNPG8poifNnbDSaj9GuwGP8aglCFzSgA9njir0T6kSp4HGxkjTAbKRG8yPLA5ovPDlJvTnzvWM7jNw99pos0VDjrSds2EVkJSJIsZZ2iKTe9ItNs1/lJjj+hmFwTrA3vpto6HLCYG4Qu11PV/3h8yWn6DNP+U+VoARSFa7nRSD4cB+uKpfeq2buzPjHVww3VOz9PnNAljMWsRxSb1/vkR3ilfNFBWh746ncNd1oTV89rcqSHDWd1XcbjwCSjQttQPKfBZI9O7n/TWNJRLSZJOfyDuHdxjGcsv/uxG9lOVk3lVoITnLbSQQSmUb3zHJ3oWsFDXEygnkxkqRsxeMo4a0ZJ0sTRnPbDLvj/uthseV2vEby/tK5+gzOyeL+UUAJrlDSX91OlEPBUpri8VzGX3NBMPGdQoJxlogRaYbXHcfkaLlT4IEXXxQJeB4eeH/IaxYR0LGXe7PTc1aeyfva0qwE4JdZI5OMe6nPtMs3TStt1EK6
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b379771-0332-4ea3-6d0d-08db6e6b2514
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:11:06.7341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWN07rhwedP81Y07Fy2bO/Bid2hWA5Lq8aGzDoIrZ1f96z1B8XKcUFxRUAFLK/MQ7hLmZB14wGP77JDxvDWjPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6547

Introduce a helper based on the current Xen guest_cpuid code in order
to fetch a cpuid leaf from a policy. The newly introduced function in
cpuid.c should not be directly called and instead the provided
x86_cpuid_get_leaf macro should be used that will properly deal with
const and non-const inputs.

Also add a test to check that the introduced helper doesn't go over
the bounds of the policy.

Note the code in x86_cpuid_copy_from_buffer is not switched to use the
new function because of the boundary checks against the max fields of
the policy, which might not be properly set at the point where
x86_cpuid_copy_from_buffer get called, for example when filling an
empty policy from scratch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v6:
 - Add more tests.
 - Drop Jan R-b.

Changes since v4:
 - Rename _x86_cpuid_get_leaf to x86_cpuid_get_leaf_const.

Changes since v3:
 - New in this version.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 177 +++++++++++++++++++++++
 xen/arch/x86/cpuid.c                     |  55 +------
 xen/include/xen/lib/x86/cpu-policy.h     |  19 +++
 xen/lib/x86/cpuid.c                      |  52 +++++++
 4 files changed, 255 insertions(+), 48 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 301df2c00285..a11c8f067aad 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -1,6 +1,7 @@
 #include <assert.h>
 #include <errno.h>
 #include <stdbool.h>
+#include <stddef.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -565,6 +566,180 @@ static void test_cpuid_out_of_range_clearing(void)
     }
 }
 
+static void test_cpuid_get_leaf_failure(void)
+{
+    static const struct test {
+        struct cpu_policy p;
+        const char *name;
+        uint32_t leaf, subleaf;
+    } tests[] = {
+        /* Test for invalid configurations in the object itself. */
+        {
+            .name = "Basic max leaf >= array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC,
+            },
+        },
+        {
+            .name = "Feature max leaf >= array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                .feat.max_subleaf = CPUID_GUEST_NR_FEAT,
+            },
+            .leaf = 0x7,
+        },
+        {
+            .name = "Extended max leaf >= array size",
+            .p = {
+                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
+            },
+            .leaf = 0x80000000,
+        },
+
+        /* Test out-of-bounds checks in the accessor. */
+        {
+            .name = "Basic leaf >= max leaf",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            },
+            .leaf = CPUID_GUEST_NR_BASIC,
+        },
+        {
+            .name = "Cache leaf >= cache array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            },
+            .leaf = 0x4,
+            .subleaf = CPUID_GUEST_NR_CACHE,
+        },
+        {
+            .name = "Feature leaf >= max leaf",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                .feat.max_subleaf = CPUID_GUEST_NR_FEAT - 1,
+            },
+            .leaf = 0x7,
+            .subleaf = CPUID_GUEST_NR_FEAT,
+        },
+        {
+            .name = "Extended Topo leaf >= cache array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            },
+            .leaf = 0xb,
+            .subleaf = CPUID_GUEST_NR_TOPO,
+        },
+        {
+            .name = "Xstate leaf >= cache array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            },
+            .leaf = 0xd,
+            .subleaf = CPUID_GUEST_NR_XSTATE,
+        },
+        {
+            .name = "Extended leaf >= max leaf",
+            .p = {
+                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD - 1,
+            },
+            .leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
+        },
+
+        /* Test fetching Xsave without present. */
+        {
+            .name = "Fetch Xsave without present",
+            .p = {
+                .basic = {
+                    .max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                    .xsave = false,
+                },
+            },
+            .leaf = 0xd,
+        },
+
+    };
+    const struct cpu_policy pc = {};
+    const struct cpuid_leaf *lc;
+    struct cpu_policy p = {};
+    struct cpuid_leaf *l;
+
+    /* Constness build test. */
+    lc = x86_cpuid_get_leaf(&pc, 0, 0);
+    l = x86_cpuid_get_leaf(&p, 0, 0);
+
+    printf("Testing CPUID get leaf bound checking:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+        const struct cpu_policy *p = memdup(&t->p);
+
+        if ( x86_cpuid_get_leaf_const(p, t->leaf, t->subleaf) )
+            fail("  Test %s get leaf fail\n", t->name);
+    }
+}
+
+static void test_cpuid_get_leaf(void)
+{
+    static const struct cpu_policy policy = {
+        .basic = {
+            .max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            .xsave = true,
+        },
+        .feat.max_subleaf = CPUID_GUEST_NR_FEAT - 1,
+        .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD - 1,
+    };
+    static const struct test {
+        const char *name;
+        uint32_t leaf, subleaf;
+        size_t offset;
+    } tests[] = {
+        /* Test fetch different leaves. */
+        {
+            .name = "Fetch basic leaf",
+            .offset = offsetof(struct cpu_policy, basic.raw[0]),
+        },
+        {
+            .name = "Fetch cache leaf",
+            .leaf = 0x4,
+            .offset = offsetof(struct cpu_policy, cache.raw[0]),
+        },
+        {
+            .name = "Fetch feature leaf",
+            .leaf = 0x7,
+            .offset = offsetof(struct cpu_policy, feat.raw[0]),
+        },
+        {
+            .name = "Fetch Topo leaf",
+            .leaf = 0xb,
+            .offset = offsetof(struct cpu_policy, topo.raw[0]),
+        },
+        {
+            .name = "Fetch Xstate leaf",
+            .leaf = 0xd,
+            .offset = offsetof(struct cpu_policy, xstate.raw[0]),
+        },
+        {
+            .name = "Fetch extended leaf",
+            .leaf = 0x80000000,
+            .offset = offsetof(struct cpu_policy, extd.raw[0]),
+        },
+    };
+    const struct cpu_policy *p = memdup(&policy);
+
+    printf("Testing CPUID get leaf:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+        const struct cpuid_leaf *l = x86_cpuid_get_leaf_const(p, t->leaf,
+                                                              t->subleaf);
+
+        if ( l != (const void *)p + t->offset )
+            fail("  Test %s get leaf fail\n", t->name);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -660,6 +835,8 @@ int main(int argc, char **argv)
     test_cpuid_serialise_success();
     test_cpuid_deserialise_failure();
     test_cpuid_out_of_range_clearing();
+    test_cpuid_get_leaf_failure();
+    test_cpuid_get_leaf();
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 455a09b2dd22..407919ffeffd 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -50,48 +50,16 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     switch ( leaf )
     {
     case 0 ... CPUID_GUEST_NR_BASIC - 1:
-        ASSERT(p->basic.max_leaf < ARRAY_SIZE(p->basic.raw));
-        if ( leaf > min_t(uint32_t, p->basic.max_leaf,
-                          ARRAY_SIZE(p->basic.raw) - 1) )
-            return;
-
-        switch ( leaf )
-        {
-        case 0x4:
-            if ( subleaf >= ARRAY_SIZE(p->cache.raw) )
-                return;
-
-            *res = array_access_nospec(p->cache.raw, subleaf);
-            break;
-
-        case 0x7:
-            ASSERT(p->feat.max_subleaf < ARRAY_SIZE(p->feat.raw));
-            if ( subleaf > min_t(uint32_t, p->feat.max_subleaf,
-                                 ARRAY_SIZE(p->feat.raw) - 1) )
-                return;
-
-            *res = array_access_nospec(p->feat.raw, subleaf);
-            break;
-
-        case 0xb:
-            if ( subleaf >= ARRAY_SIZE(p->topo.raw) )
-                return;
-
-            *res = array_access_nospec(p->topo.raw, subleaf);
-            break;
-
-        case XSTATE_CPUID:
-            if ( !p->basic.xsave || subleaf >= ARRAY_SIZE(p->xstate.raw) )
-                return;
+    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+    {
+        const struct cpuid_leaf *tmp = x86_cpuid_get_leaf(p, leaf, subleaf);
 
-            *res = array_access_nospec(p->xstate.raw, subleaf);
-            break;
+        if ( !tmp )
+            return;
 
-        default:
-            *res = array_access_nospec(p->basic.raw, leaf);
-            break;
-        }
+        *res = *tmp;
         break;
+    }
 
     case 0x40000000 ... 0x400000ff:
         if ( is_viridian_domain(d) )
@@ -106,15 +74,6 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     case 0x40000100 ... 0x400001ff:
         return cpuid_hypervisor_leaves(v, leaf, subleaf, res);
 
-    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
-        ASSERT((p->extd.max_leaf & 0xffff) < ARRAY_SIZE(p->extd.raw));
-        if ( (leaf & 0xffff) > min_t(uint32_t, p->extd.max_leaf & 0xffff,
-                                     ARRAY_SIZE(p->extd.raw) - 1) )
-            return;
-
-        *res = array_access_nospec(p->extd.raw, leaf & 0xffff);
-        break;
-
     default:
         return;
     }
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 6d5e9edd269b..3fcc02c729db 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -540,6 +540,25 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err);
 
+/**
+ * Get a cpuid leaf from a policy object.
+ *
+ * @param policy      The cpuid_policy object.
+ * @param leaf        The leaf index.
+ * @param subleaf     The subleaf index.
+ * @returns a pointer to the requested leaf or NULL in case of error.
+ *
+ * The function will perform out of bound checks. Do not call this function
+ * directly and instead use x86_cpuid_get_leaf that will deal with both const
+ * and non-const policies returning a pointer with constness matching that of
+ * the input.
+ */
+const struct cpuid_leaf *x86_cpuid_get_leaf_const(const struct cpu_policy *p,
+                                                  uint32_t leaf,
+                                                  uint32_t subleaf);
+#define x86_cpuid_get_leaf(p, l, s) \
+    ((__typeof__(&(p)->basic.raw[0]))x86_cpuid_get_leaf_const(p, l, s))
+
 #endif /* !XEN_LIB_X86_POLICIES_H */
 
 /*
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 07e550191448..a93b372e29e1 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -546,6 +546,58 @@ int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
     return -ERANGE;
 }
 
+const struct cpuid_leaf *x86_cpuid_get_leaf_const(const struct cpu_policy *p,
+                                                  uint32_t leaf,
+                                                  uint32_t subleaf)
+{
+    switch ( leaf )
+    {
+    case 0 ... CPUID_GUEST_NR_BASIC - 1:
+        if ( p->basic.max_leaf >= ARRAY_SIZE(p->basic.raw) ||
+             leaf > p->basic.max_leaf )
+            return NULL;
+
+        switch ( leaf )
+        {
+        case 0x4:
+            if ( subleaf >= ARRAY_SIZE(p->cache.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->cache.raw, subleaf);
+
+        case 0x7:
+            if ( p->feat.max_subleaf >= ARRAY_SIZE(p->feat.raw) ||
+                 subleaf > p->feat.max_subleaf )
+                return NULL;
+
+            return &array_access_nospec(p->feat.raw, subleaf);
+
+        case 0xb:
+            if ( subleaf >= ARRAY_SIZE(p->topo.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->topo.raw, subleaf);
+
+        case 0xd:
+            if ( !p->basic.xsave || subleaf >= ARRAY_SIZE(p->xstate.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->xstate.raw, subleaf);
+        }
+
+        return &array_access_nospec(p->basic.raw, leaf);
+
+    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+        if ( (p->extd.max_leaf & 0xffff) >= ARRAY_SIZE(p->extd.raw) ||
+             leaf > p->extd.max_leaf )
+            return NULL;
+
+        return &array_access_nospec(p->extd.raw, leaf & 0xffff);
+    }
+
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.40.0


