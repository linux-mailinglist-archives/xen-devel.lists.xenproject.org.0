Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACADA619ABC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 15:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437676.692118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqy9s-0005gw-2v; Fri, 04 Nov 2022 14:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437676.692118; Fri, 04 Nov 2022 14:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqy9r-0005er-W8; Fri, 04 Nov 2022 14:58:59 +0000
Received: by outflank-mailman (input) for mailman id 437676;
 Fri, 04 Nov 2022 14:58:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pjMC=3E=citrix.com=prvs=3000da1f0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oqy9q-00058H-W1
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 14:58:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 349f1b27-5c51-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 15:58:57 +0100 (CET)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 10:58:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5848.namprd03.prod.outlook.com (2603:10b6:510:30::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 14:58:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5769.026; Fri, 4 Nov 2022
 14:58:33 +0000
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
X-Inumbo-ID: 349f1b27-5c51-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667573937;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+HzJr+tf6eiD9vL5z/PkLCdmhiIDHTr+hlooizxB8xA=;
  b=QTZtEbfyLpURtaDqjZYmpVXIKWyNKlXK/5lCoALj+vnhbVpg1aqZeXHH
   76fpxqYdLkeyr6nVTUC4NZ3HYZTfHfzszxP56MlKLLuaCfx22rGA812Kj
   ISuQzd8NtSRzwZD+4algPElmR/JmhI0elAhzPNPWyQlm468kRTutGtHbx
   o=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 84182728
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8ziN+a9x1MIzNUYEQUblDrUDmX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2RLXG/VbPePZDP3KYhxaN+w8EkCupaAn9M2SAE9+Xo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKgX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklQ9
 PsyeRFdbSmphvnx2ZeBUuRMlJgseZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUuiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCN5LROfnrK4CbFu742pLT0YGTl2Hh+CSjxewAPRfd
 k8F5X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO87QyY7k
 GCAmdzBDCZq9raSTBqgGqy8qDqzPW0eKjYEbCpdFA8duYC8+Mc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNsmuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:E9fOmakuYDn1YheXKOeeOp8tW6DpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duf22vaIJy4EUbICbQRGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.96,137,1665460800"; 
   d="scan'208";a="84182728"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYdUosvGNGcmWuCr6xbvWvbDX/47H00L/2QbPhScEGDN4MoUUfUP3X2lHSkwiuoX+PEopz2w3xcwKEmkOn2ptR9AVW1UgHFnet0efApiYlC0+FqmQ8Vb8fGqi579pnuZ64u99hPdoi5RF2mHjfGr3TjCIQb7HROsmJrtJPg2gQWS2+k/b63nvlGhBKS1uUlfsL5Szq5A+P5m0GxoU0FautbOBElp9M7jll/pvdjD9NfeUuyl4wImcnlT2SjVOSH4CiCi/eoFe1Z1gJbH4iBFbGuVd17nbauaoXTY59Cj/GRHGO9Ps7+ZVxPC/Gl+cR8A1o3W7BNgp8LB+yZw8IYx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HzJr+tf6eiD9vL5z/PkLCdmhiIDHTr+hlooizxB8xA=;
 b=jyoxKHjvaH1HTXLHIJV7FjdyQ2onwyuLIq87UXTUByafXQ4nOxFBCNYc9FgXdvPRJUoZRjz6eq22FuviTXmSskWt57clXQkBNjpHy64EZImTHr+Nny9tsdaZJqpytbmCWZo67F+tjcJEQCrJOpj949RWFiVTqAYHEFLKjJb2NIyzrxXYdPrTVohffxn/mt5d6iGHXZlnZjBmrlI4MyeA06bZCF43h4S9yd3ur6oCb4vVghGGxVhq7MOx4F+C439LaIhQvC+qQFxmJDdZqNXN4tEOHT+CChMPqBAAjP3xgo3jdihfrnEGnhuZIFK0oE9jAB8vARoagLHqZyGd0cK4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HzJr+tf6eiD9vL5z/PkLCdmhiIDHTr+hlooizxB8xA=;
 b=UzvHVvQsDj44gYoOk884XYA97xC4cPwMXVXAxSiyQAiq32vWbwtPIEkHU5S8Iaf2n2+XkCBr50VSRu/GYA8sjSB+yfpzviULuEtgIn0dpbaK4AhiuW4qDt8uF/SLgLBLqh8WDtvd4NHleGa0bYyYXXgh5qpRRMDpMOHbH0+jHK0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17] Revert "x86/HVM: also dump stacks from
 show_execution_state()"
Thread-Topic: [PATCH for-4.17] Revert "x86/HVM: also dump stacks from
 show_execution_state()"
Thread-Index: AQHY8Fv1+K7IFcVij0qSJnf5kUFrU64u2xiA
Date: Fri, 4 Nov 2022 14:58:33 +0000
Message-ID: <e84339f0-b020-409e-4b18-6be7c29bfad5@citrix.com>
References: <20221104144337.36844-1-roger.pau@citrix.com>
In-Reply-To: <20221104144337.36844-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB5848:EE_
x-ms-office365-filtering-correlation-id: 69b33d2a-53fd-4fe4-9cf8-08dabe750b30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dxFXmuztuUKv3KQ/p19qo5pjmywpTPfvqBXWavgdVBZZSje5oo6qmYPUX0sv+CRVwa4qv6uMWjulv7WOJp5LmJL0ui5JN1GK6Tf1ygoXV9cOl2l5CP4x0tz7Pav8DqkjX5T06K3P3U3+wZ9SX7xbBvXRbfX/tSEqRfBWMKCK/6Dz1vHo9NfQzGdYlqpSTeJeEqfo/z04jqk8d7XkDr1q0PZHv74XN54yzLxHg5WOz2GmGTlbINUXRTlSeIYYHW3p0Kl74B7vmMpUAC3HvnQoKTN/cAbiiO48kJbK6WDtugGIfgH+9rySYDbK9rLvwh6h8hc6gsD1ODNc2mvSgtLHGM18Lbp8kvFPOKV+lWpwXZU9mWQSD4NiLg2kBtpXPzPa/v69IKF+AEda72DrVkqFPhPr5FQoY57tfLWz57z5QSm8W6tkfIX9lK1TBvMLxI0YytfPrCH0KTGELkHh/+w5NHaK1/p1Dz0CMy9NWmCcIEvbDLJZpKw87Lc4E5r2VudvMlkAOei1tB6WQEUhJMULHc8h2gWn0q8DgmGQbaOy50SM3Y65XQBPOc93BVmVGSragraebXxsDF7bAJ/RFVwjks970d7PffRQV9IbNr42/OU2EreCgd/LmIY/8+wX4KPintp2Rn2++bu9/iaaUY7O79GMEYnzga7bS8yP5arlcMbCJLkKWuioMXaNn/oTcyXkxloGUVQC7hKI2FY6I66ekJIZq6H4F++uBtn/6EAafl07xiA5kWhrsvuNUBN+46D7ZpmVPyKLvePWnBvh9mjGXhk33fldnZHy8q40Q6pZ6o72lxkxzAeaYf9QmGtxG2+HcdhcZS2nF4EYrzwgnCJ1OA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199015)(71200400001)(83380400001)(31686004)(38100700002)(86362001)(31696002)(36756003)(6486002)(2906002)(4744005)(122000001)(38070700005)(186003)(82960400001)(6512007)(53546011)(26005)(2616005)(6506007)(41300700001)(66946007)(76116006)(478600001)(91956017)(4326008)(66476007)(8936002)(66446008)(316002)(64756008)(5660300002)(66556008)(8676002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGdGcGozL2Z3QlQ0LzVEaUNnTDhBbkRrRXlyYnNiZVhQa0tNdG1zVm8zemF4?=
 =?utf-8?B?MVZnYzJVZndiaHdRekFtT0JjNzcvQk5kMU9wVEJYaVVERCs1Szg0eDBFV3Qw?=
 =?utf-8?B?STZLa1hQbTRaZi82TGcvcS94UWJBdHB6aDZNeVIxaENsRHQ3aUEya0xUbkxv?=
 =?utf-8?B?ZWJlbDVHNUNRWS9SbU5DKzQ2NjdBeDVJRGV6eGdhRnRsZlJJUDVobnlEaHZ2?=
 =?utf-8?B?M1NkTG9udUovalNhdEh4NW1EUHloT1BXVmNGMStKRE5lOExJRE1CcGtWK3lx?=
 =?utf-8?B?eUpSWHNtQXFaUnMxODNyK1dUY3Z4bW55MXU0MjlYZ1dES3lCY1lzSEZ0ZW1N?=
 =?utf-8?B?Wi9OMVRYYjFWQ0dhcDR2VFBINi9sVHVRL05idHlYRGh6SGdOamRwQS9MajRT?=
 =?utf-8?B?UVJPVk12Q0lxejZCSk9xTVN3THlXWFZxaTlzUVpoQTFISktaajREZWNpY29k?=
 =?utf-8?B?MGI5dVBUdFhtTzJPQk9TZm14UnBDWmZNRVVMR2xScnF4VkF6eHI0RUJaYlBm?=
 =?utf-8?B?OGlWRkdHQjk4eTNhUGZOaWFkV210Tkh4UW50alFHRjZ5M3FYQnFIcmREakZi?=
 =?utf-8?B?VzRZMXdST1pHUjN0QkY1QmpsblFObnJWR3BUdEk2NG9mQnJ5Q2xkVG9TdlM3?=
 =?utf-8?B?Q214Z005Nis5T1pKYSt2QUxhdGQyeVV6WWN2Y0prOUd1UkVGZW14RXZTZ1Rn?=
 =?utf-8?B?MjdkYVRzTjdZamNWb1BFZW9GcG9sWHJ3OStZcnBLbTJuaU96TGtTZnpPaUlT?=
 =?utf-8?B?OGhiMmVxVndzeFVFL2ZJNnB5c3hnMWtFRWE2cjRYcmxjVmdDcm5pL0lQeXFQ?=
 =?utf-8?B?b0VkSXNJNHA2OStNR1dId3lQUHlucmk3TW9qK2xib2krc3RZR2l4VkFPdVZL?=
 =?utf-8?B?b2dvcXRZREF1NmJEaG9aTUFNbXVWWHNXR3I4aWpNRmNUeUpFU1FZMm9zOGE5?=
 =?utf-8?B?d2VlbTJjU1ZpR1llZ25YWFRlUmpwNDVHdWF4VEZ1U1FYNkVQWXFxRDNyY2dO?=
 =?utf-8?B?bjY2eDFPNzZrOHlZWWpwWHB2d3ZHY0lFWnRIeUorTGhNbVd1bmZSUXMxWC8x?=
 =?utf-8?B?bUMwNWVoUFJwWGFjRGM3RkxCR09oRkFiUHhhSXdQejJHZjFJalRzUFc0c29M?=
 =?utf-8?B?MDUxaW1uZVg0Ly9iLzdWZ1RzeFVCNDgxTHhJTFI5MnVaQUNqMFVtM3RDL2da?=
 =?utf-8?B?YW96aEtQYzBwb0pDZjMxVzNNMlBaSjZkK1BjUlZzV1VuVkdOYnVJNGkvVXBt?=
 =?utf-8?B?TFRoRUw2bE5tUTFaWHd0ZG02SHlDMHdKRlFWdU1uR0VuWFNZcDMralQvaGtB?=
 =?utf-8?B?UkViaW9oRkd3QkpjQkNEaEV4UHcydkxsTXZWT0ZLUnlzVnhQZ21ZTkNHUEh1?=
 =?utf-8?B?eWRrb0ExOENlODgrWm84U3lVaTNCOVIyUmx0U2dkaHBBdWkrRWRwdkEyUzc3?=
 =?utf-8?B?VGNYV0luZU82YU83VUhNalhTZW1oaDdhekpWQ2JRZ2d4MXZuanZqU0dvQWll?=
 =?utf-8?B?SVJFWlBNak1FK3Avek9Ka3IwMTRzc2NSOGhBU1pTWEE5SHgrUnY4Y3N1VlVa?=
 =?utf-8?B?dGFDbDhNTW8wS3dhUllmOHZjRU5NUlpKTU00VVJoRHB0NHJjZXZHSGxTcWpH?=
 =?utf-8?B?RXdxMmR4SElnajJlWC9LdmVJUWFnWGI2NXBUUjJ5bVZva2sxbkxJNm1UU2JV?=
 =?utf-8?B?ZXJxN3VCbmx4OWxibitqWUpSVHd3U3JNd3QwSnpzT25sZzNJVjl3VHNaaG44?=
 =?utf-8?B?QmVQUVZ6Z3lBUmVPYUoxc2h2OTVsK2s2ZVZCWmlPSHlPQjVNcjVxNWpmdVNn?=
 =?utf-8?B?ZlZBdUVLNXBqb0V5WlhFNURIWHQrbVRoRURWblJuR2Frem85YVd0K3RuL05N?=
 =?utf-8?B?K2UvSmtWZ3E0MWUyZUJMOVFMWjZIZWs5WGZWMkNZb2xremw0OUJwNHpqMkhu?=
 =?utf-8?B?MFo4T1RlQzdUWTIzWlE4dU1lVDNxeUJFVDFYcW41MnJJbU9jbm5tYmg3NTJ5?=
 =?utf-8?B?dWhlUWhUTU9adDRYay9kaFZwZituR3FPZDNrNlBlZjloeldNM0pQcTNFYzdn?=
 =?utf-8?B?L2c3T2xDM1lXdWN4R0ZLQUFJRDFoUW1SL2RKclBnbkx2bHNNWmlTZmtmRjRl?=
 =?utf-8?Q?tGPLiTI2j9hA4MTkgk4ihpO4w?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C073CE21D809044BC5289DE8C659AFB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b33d2a-53fd-4fe4-9cf8-08dabe750b30
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 14:58:33.4220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PA+qiyUAHhTPfVsAtrsSJmRUCMrTS9ShzFbEXJUAVFYP42GYcec3sb4Rv7st0cqIs7SsCCvz5AOqwaHYlzVR7bVDL8L7qIo8DKp77NhSE3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5848

T24gMDQvMTEvMjAyMiAxNDo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBUaGlzIHJldmVy
dHMgY29tbWl0IGFkYjcxNWRiNjk4YmM4ZWMzYjg4YzI0ZWI4OGIyMWU5ZGE1YjZjMDcuDQo+DQo+
IFRoZSBkdW1waW5nIG9mIHN0YWNrcyBmb3IgSFZNIGd1ZXN0cyBpcyBwcm9ibGVtYXRpYywgc2lu
Y2UgaXQgcmVxdWlyZXMNCj4gdGFraW5nIHRoZSBwMm0gbG9jayBpbiBvcmRlciB0byB3YWxrIHRo
ZSBndWVzdCBwYWdlIHRhYmxlcyBhbmQgdGhlDQo+IHAybS4NCj4NCj4gVGhlIHN1Z2dlc3RlZCBz
b2x1dGlvbiB0byB0aGUgaXNzdWUgaXMgdG8gaW50cm9kdWNlIGFuZCB1c2UgYSBsb2NrbGVzcw0K
PiBwMm0gd2Fsa2VyLCB0aGF0IHJlbGllcyBvbiBiZWluZyBleGVjdXRlZCB3aXRoIGludGVycnVw
dHMgZGlzYWJsZWQgaW4NCj4gb3JkZXIgdG8gcHJldmVudCBhbnkgcDJtIHBhZ2VzIGZyb20gYmVp
bmcgZnJlZWQgd2hpbGUgZG9pbmcgdGhlDQo+IHdhbGsuDQo+DQo+IE5vdGUgdGhhdCBtb2RpZmlj
YXRpb25zIG9mIHAybSBlbnRyaWVzIGFyZSBhbHJlYWR5IGRvbmUgYXRvbWljYWxseSBpbg0KPiBv
cmRlciB0byBwcmV2ZW50IHRoZSBoYXJkd2FyZSB3YWxrZXIgZnJvbSBzZWVpbmcgcGFydGlhbGx5
IHVwZGF0ZWQNCj4gdmFsdWVzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+LCBhcyBhZ3JlZWQgb24gdGhlDQp4ODYgbWFpbnRhaW5lcnMg
Y2FsbC4NCg0KfkFuZHJldw0K

