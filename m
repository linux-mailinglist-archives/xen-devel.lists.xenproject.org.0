Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24771590EA4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 12:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385511.621179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMRXG-0006TQ-5g; Fri, 12 Aug 2022 10:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385511.621179; Fri, 12 Aug 2022 10:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMRXG-0006QQ-2J; Fri, 12 Aug 2022 10:04:58 +0000
Received: by outflank-mailman (input) for mailman id 385511;
 Fri, 12 Aug 2022 10:04:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hyho=YQ=citrix.com=prvs=2169cd8bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oMRXE-0006QK-SI
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 10:04:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 357d2b30-1a26-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 12:04:54 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Aug 2022 06:04:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5116.namprd03.prod.outlook.com (2603:10b6:5:1e4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 10:04:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Fri, 12 Aug 2022
 10:04:45 +0000
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
X-Inumbo-ID: 357d2b30-1a26-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660298695;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9PX1POnGB790/9++cgaZ2LtwGneW0aZMCffnbsD+9gw=;
  b=icqG+uGM3h/c6Lb8D7jx9tmbdSXFm5N+abc3AX/0b5HqUYZ3m1dqmwjo
   J9OrCUZu6VnFu8W4MMNvmaCkgWbzpJZKI+peO750BW+Pfi0SW331FfLoF
   K3QKeHJaFdGV+OAj2n3uO7C6GPKjS232j8r2+q6IJgk1DbS6KGnd3J+Np
   E=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 77946482
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+N7ibKML9zbkBpzvrR29lsFynXyQoLVcMsEvi/4bfWQNrUoigmACm
 mVOXj+DM6yMamOnf9gjaojj/U0B68LUn9dkGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/vZ8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFOx4s9RAWNqercCpN19RkJgz
 sEnMDYkO0Xra+KemNpXS8FKr+F6dozHGd1avXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr5wCChI1W0q3rMzUYzy0HVwBZ8z/7GN93Nd8bRbc5UglyZt
 iTN+GGR7hQya4POlWTZoijEaunnkiLbSplMP4OC09Uxo3+0nE0+DRcZfA7uyRW+ogvkMz5FE
 GQW8Cczqak59GSwU8LwGRa/pRasoRo0S9dWVeog52ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2IB5UlqY/7aQ6D+3Zy4cKDZYYTdeFFVVpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2OBApJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:LqPa1K0ouw/0o0UyxtUWfAqjBZpxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkfd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7nF6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklUqvoXRiKrbzPIt
 MeS/0018wmN29yqEqp51WH9ebcGkjb2C32GnTq9PbliAS+10oJsnfwjPZv4kvosqhNC6Wsrt
 60TJiB3tt1P7ArRLM4C+EbTcStDGvRBRrKLWKJOFziULoKInTXtvfMkfwIDcyRCes1JaEJ6e
 L8eUIdsXR3d1PlCMWI0pEO+hfRQH+lVTCozs1F/ZB2trD1WbKuaES4ORsTutrlp+9aDtzQWv
 61Np4TC/j/LXH2EYIM2wHlQZFdJXQXTcVQsNcmXFCFpN7NN+TRx6TmWeeWIKCoHScvW2v5DH
 dGVD/vJN9Y5kTuQXP8iAi5YQKYRqU+x+MELEH3xZli9GFWDPw8juE8syXL2uibbTtfr6cxYE
 xyZLv6j6LTnxjFwVr1
X-IronPort-AV: E=Sophos;i="5.93,231,1654574400"; 
   d="scan'208";a="77946482"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVYJ5bSBi+X2O8T7jsndeO5sGxRkUhOfQEr72+hs2Hewqxi5HyYp2VojXQDWvSgVpDkN7ZbDybYQqFl3i8/QARh69ZnsAeeTylPgbybsgJKCRgBO/iAtDgIcFH5HdUB2N9dArHivb/dM6XOHxA0ANBjfvwwvG696KbRLOjrNXS4LhVJ/GqcKjbjxVyyLWb7qBQwaRnRhQQPHYXaINqFyho0esQOZ2F+zMDwX0F8PHF2KxOaLGxwuH6aNcKZczPCVTmRfOpE6vhNVtDivuWX7QozI7Dd1mjh5Pgqf6JAMUQmg9hl6oZ7p1exk/LO6V22k0NSUjSfzg0OlhcsUlgJQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PX1POnGB790/9++cgaZ2LtwGneW0aZMCffnbsD+9gw=;
 b=TbAWan7pf7e5GiSm2wtj5edAJlzYwB13fA0Up2vFhBr/sPvyHMLl+zSPRtKl5rSVQPN2N5NEQuC3J4sNkgTId4S0T3RiGllNxQFGjhgT2iZUIr/7Omv99pOoKkUKz+9ifBF2QJA6vG2gofgie+wKMBvTcSCGNCTOkuKhVfTvPP/JCr4rw3wD3MYYRm1KUvCpXjC4T1kBio9tcyHdGbyRlgBiSXxUxKb8LgJYHpIAQCvjYLyJnEYf9Xk2t/weUMuOb4rcJXoSCb4t3axDvd7jT/TO6GqgSn9rZp/db4NSWoh0WR2OP6fgLPnsfTyw04sk0iJe90J9B3SPH6JE/3Hv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PX1POnGB790/9++cgaZ2LtwGneW0aZMCffnbsD+9gw=;
 b=N/8SxbC3DIZVwNjk+6Oy9Sivv3l+v8/SA6plzJUtFHw1wZYCWFS1IWc4M3TELyV1iyu4f6eLu7icxvxuaYapPjo8wblzXqkismosrwf/2yllJnClP+ppO9UWV5PnPkcGACnLko1a1rAzexi3R0z7nZUBKsCWTKBQlGTPb52v93E=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/svm: Keep the RAS balanced for guests
Thread-Topic: [PATCH 2/2] x86/svm: Keep the RAS balanced for guests
Thread-Index: AQHYrbzfrT+bJPIlQEuwk4UCdkz8u62q3u4AgAArfAA=
Date: Fri, 12 Aug 2022 10:04:45 +0000
Message-ID: <01c8626b-9fdd-5dcb-c5d9-4042d9df1bb8@citrix.com>
References: <20220811195905.7780-1-andrew.cooper3@citrix.com>
 <20220811195905.7780-3-andrew.cooper3@citrix.com>
 <c7eb68f3-4c86-b033-c57e-bb64fd8729b2@suse.com>
In-Reply-To: <c7eb68f3-4c86-b033-c57e-bb64fd8729b2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb3da512-4b42-4ef7-a3db-08da7c4a1571
x-ms-traffictypediagnostic: DM6PR03MB5116:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 r5gnerrYGvAATzocC5H/Ng/uZydCHawaaC+HlrDFViWS0sXrXLGPYUsr1stJJvewxwpFG33GGzM+CiBctmneWvXH/Zx0iXRwNLZJjaACyFFFkUFtZN+JXzuR27s/FpVc3odAG233YOTZ66IQ8RapDT4hfs5W6+7f/pkEPqTWo7MVqc+tmQgxFZ0j7fg2LIIf4wHWb9lvycLEHyj4gpTAyvOG4yqwqjQoItjdDzc1/9CNCfNkJCG9Z0q9x1QRfHEKZyaY4IWMVc6zYOG+slFtwG6ZWe+DT/OXm6fy8Em0C3q5zmabtjDunHd+Q5uREr8i0+i6Z2Iqh8n7I/BkP1zShMjCF7skXNxcnAaXUxXEwFF2SqRr++rhnzuh0hv7Tl5hn0mvgtWHQ4A2dPW0aROipXo7s8JeTVRa/PfVYJpx6SMSFlAFYmzh+s8XqmwIOwFB61AOOGCCKlhPgiJ1FAit8h1oItKvwGbYW6Vwg3/QI9Mwj6oSikBbsFwB+248JG19QbxtgSV6/UxZ7urKEhN5if857YJXdASg4VJRYmYjPnqEqY7ViKtw/8jWGDCuw+diBYSQZKC7IM6yVNIy6JOMauwRtx1Nmv+WSYzehUqZsBtSMGeK+sQX9AvX5Qlt8goK1i6kB//kFoe9m6B/6VA+sQGYsMQen7Kn+uPjWLE0tyqFzKjQldYIJ9o1p5DsiN+mCR8HHyPa3Tm91w4meKro9KWCyvvc8XxrQ4ELDaaTqFWBM3VNRFN+Fkm+xQ2WHCBGE270TK0qHNYtOcAgOHLSk8m2tNRmXAaulTcAkPAqdqeaZW/gYALWnpPsvJWPDP7gLJmcACvaEDoPaPO/bQshadzbUdmi97EvF80J+mps307JO7OXrfVRYy9PY/5yDBHN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(38100700002)(6512007)(122000001)(31696002)(26005)(4326008)(38070700005)(6506007)(76116006)(91956017)(66446008)(64756008)(53546011)(66556008)(8676002)(6486002)(478600001)(71200400001)(82960400001)(316002)(41300700001)(66476007)(54906003)(36756003)(2906002)(66946007)(2616005)(186003)(66574015)(5660300002)(8936002)(31686004)(6916009)(86362001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXd1bWlPZE1wdm4yZFpsMElCdG91N1NBc3NVTEd0Y3JqaENCTDVjVkdtL0Rv?=
 =?utf-8?B?YTR2akkxMHI3eUY4aFFtVzZmUlF1cktCV2tHcHExOHQ2UE9Oay9VM041azhj?=
 =?utf-8?B?M3E0eUx1MWtjeGlnUGgrb1F3VUZadVpqaFNQbGd4cXN5MU9ZUm5FaHpzV3RE?=
 =?utf-8?B?anNOZy9xVnhhZmZZeXlJclhYbmNLekgzWkhxNWUzU0ZMZjBlTkZ1MS81UXNR?=
 =?utf-8?B?VW5rWEUrSzFzaEVXOUs5M0Jhc0ZSYzRMRUZKOHgzUmVRaE9XTkRDRWhTOWVK?=
 =?utf-8?B?Y1hRa0U2bXg1MHpMMG95ZzVsejVubCswTEhzUm9lZ0tSU2lWYW5malMvVlAv?=
 =?utf-8?B?QU52VVFwdzY2MDJtWW9vcHA1UUN4c2E2eWxRMk1ENnVMTmJRZ29OemVhdUVm?=
 =?utf-8?B?SWJ4NU5Dd1M3VjNYTndKTjFYd3JTakhJdU8xbFZxdVU3RHl5bXdOMWNIZ256?=
 =?utf-8?B?cDdzUEdWSmtlMkhxMDFLYWNPR3NIclp0dDlDMWhEM09SOWVJZ2hhQ0RqUXpn?=
 =?utf-8?B?NmpORWNSRG1ldGNmaXJCbDFSSUlmOHcwZ213bHRnOHpCd2g0ME1qOXlsWEJ1?=
 =?utf-8?B?YTUvSkR2d3BCdTAwVUdaSlcxSzFyYXJ5cWJUemxmRy9HR2dlOFJJOWthNzB5?=
 =?utf-8?B?VmM0NXRNN2RYZWI1RCtXcTd2WVRwdGZVVkxYYyt4TFlDZ2MvS3F4cnEzUnpK?=
 =?utf-8?B?VXJtMEptcmxNQVlTTWpUOURncENnZjlGc1lrai9CeEFkdFdJUTE0aXpTNlVm?=
 =?utf-8?B?TmtSc2E3a3o4bk51VWhHSVoxVTlVWGMyYzMyOVlCM1BRWG9ENTRSRlkzbmNH?=
 =?utf-8?B?eTNuL2NsTmtxUitxTzMxczJ4YUpTcVBDalRmSHAveG5sNEQvUnp5YWJ3dWVK?=
 =?utf-8?B?eUMvN2lVYXd0ZEgxditiTzFvblR5azU5SmVJQUREeEtjdHpHR241dkhZNktL?=
 =?utf-8?B?OTR6OHFGWnE5V2Z0UjJheE1iWU9LSEE3aVJzY09KVGVCVTg3d0p3aUNmQVVu?=
 =?utf-8?B?TFg1THVKSWJBd0VOZ1QzcTJrVGltam5BOGx0MWhvN244TkJqYlRFU3pXdFRu?=
 =?utf-8?B?dHZaK3B1RTV5N3d1dU9EbjFtbktCcGVmTnpGVG5wMzlESE5WMitqbzFJQkd1?=
 =?utf-8?B?WkdIY2RGTmxOcU45d3lROXlLNWt1aDk1S1RHUkNOajA5b1E0WW8vVkFhck5U?=
 =?utf-8?B?MWZVUUxpMXVhMUVqZnZXQWVBME5hQk1UWXhSNy9IN0N1TkpqUkJNTnZGaWhl?=
 =?utf-8?B?ZWgxSGYvdFpyWVJlZ0pDTkw2b3JHYTBrM2Q1ZUtrY2t2Tld0M0NraS93NndS?=
 =?utf-8?B?UUJDWXRQZklNRXZaQ1RrRjhic29jRFllSzY4V2RzVThhUEVNS0NDbmt3WjBw?=
 =?utf-8?B?UWswNHNaWUJFcUh3U2FvSlVvRDB2cnRhVE55NHVsVWo2L3paSURDT2ppdUtH?=
 =?utf-8?B?dFZPSm1tNUFKdGlOTFBLQTRzbG1haHVUTHVySUVJNkJycW9vUmlqM0VLSHdH?=
 =?utf-8?B?ZG1HcXRaSVVvSE5yM0ttdDZLWjhnNWx1OHprcWlCdVh6QjNJSXRaR01yaXFI?=
 =?utf-8?B?bUkwQ000dVFQcXJTUldaL3dXS05pTXlwRGNYZVFWcEFXYkc1SnFDYUJlTmRH?=
 =?utf-8?B?cXJEanltdE5mVEZjS1VzdFdaM3kzbHdQQjhsNGpsNVdyYTh6VVlxQXNycEM5?=
 =?utf-8?B?clFnZXhMM2c4QW5nT3REWlFxZHRSeC9PbmdORjFBRk1RaHZ2NWZSV1p6a1JC?=
 =?utf-8?B?eXc4cWhSVmxGU0dLeDlvRU1KM0JQNkh0QWh5NFRJUW1YbGxKY0xXNFAvbVBt?=
 =?utf-8?B?c3lLSFcwNEQrS0FiVmRTUm1zVUp5N1JlUFE1ZVFKYTdiYXVaeUsrK3pEczQr?=
 =?utf-8?B?dlB6REp6elZGRjFzNTFMN3FiYmxOT3grbyt1Wnh4U2RYTjZSR3lEcy9LUits?=
 =?utf-8?B?RGRvcWo3ME5BK2tVZDBCQmhtTFVPNGRnQ1lhNnUxQVRSWkgrRy9GR2tjN1Rr?=
 =?utf-8?B?eHEyNDBXQlBSaUZMaytPb3RWd1psdWR3a2Y2MFV1cFlSK0ttZlFnNlRITXRk?=
 =?utf-8?B?aFhGVlhrZm9GQittZjArSjNBTUsrR09kSEdHekZsTGtVT09iYWpSdUxvUDIz?=
 =?utf-8?Q?IiDnZCPJ+grbL5oU1lTmjXI10?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D732444E170A0345A4607884191A921C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Tt1dJpyARq1IDl54cN8tRR4S105uIF1TREhw8PkK7wgrItsr4eHQngmvCphDGb9qnGWI1IbqV+CN5yPBspDY+71kUrYSP3mPyfMmZkrm2Mqw3t8Jr5F8jNRqnEZJ3bB9Kjjv98nS5YrGgZKwGiB/uTWxZ8lJHqJ5iYLB236qC5gdGPUZRvD1YEosuUJrgNfX6SQqKL8wJO4A4yCWdDGqJN+/G3dJOM9M4RojnudCbFyEYSWW3UmGVW4YzXfoPy/q5UI920ALhPEkXWZDgmWn8LBIocxrf6nfsQElE9PJbbtw0GyPy5WRC0WMiATCMX9zcBMAWKMkQ0+yBAEpIDMwYaiyejgZ/PnTpZGu5JFIZfjedclJJgSo2ZdNI6ZviqKzb/S4wtkfGCPwz38UQ6s18C5dQi3B1kiQELwSbj8CkOD/a41VhJMhqXsXy7XLTpa0AwWZQzApJGi23unHlA6pGRL/cKNknyupdzOUves0ko7nnZm0riLAc99lG/Qkd8BZKvlHVrLH8ZrQpC5CIvgy9Xekbck/qF+t9adaQf92id69qTS/NZZCJPqh8aTcwifZs2DzALGCrgOSk110LVvzCxWy9Q1HyZGDpUoKvaGs/BdmO0j4x4CJkg5LAwrmThAq+TnbqRtlBBtGqT7RraSrzSwgAd4lyZXL32ArwWt1xebECYOLIh8iUDXYzRGLBNxoQlHXzTEuOo3oyiI2YcXFx0BLPmPOH5OcBv8cDyB9PF2j97fasYWC75RaidCuocObgp/Hvd6BnZg58ET4RqXVUcZsOFrlYK1Pv1E7q0tNuv9GRM5T9gnInJSNIc1Rn5II
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3da512-4b42-4ef7-a3db-08da7c4a1571
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 10:04:45.5227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oXlxiYrQkqzJxbA+xyY8AoPFKaa8MnL7xyNCM4dLKGLsGLmGXn7MRDcBydRqR/4IS3y91Ffjn7CuANOMuClEI2fjyOIebRg00bXyzAZqVuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5116

T24gMTIvMDgvMjAyMiAwODoyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDExLjA4LjIwMjIg
MjE6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbmUgc291cmNlIG9mIGxvc3QgcGVyZm9y
bWFuY2Ugd2FzIHRoYXQgZmFjdCB0aGF0IHRvIHByb3RlY3QgWGVuIGZyb20gYQ0KPj4gbWFsaWNp
b3VzIGd1ZXN0cywgd2UgaGFkIHRvIGZsdXNoIHRoZSBSQVMuDQo+Pg0KPj4gSXQgdHVybnMgb3V0
IHRoYXQgQ0VUIFNoYWRvdyBTdGFja3MgZ2l2ZSB1cyBlbm91Z2ggYXJjaGl0ZWN0dXJhbCBndWFy
YW50ZWVzIHRvDQo+PiBjb25zdHJ1Y3QgYSBsb3dlciBvdmVyaGVhZCBtaXRpZ2F0aW9uLCB3aGlj
aCBrZWVwcyB0aGUgUkFTIGJhbGFuY2VkIGZvciB0aGUNCj4+IGd1ZXN0IHNvIHRoZWlyIHJldHVy
biBwZXJmb3JtYW5jZSBpcyBzdGlsbCBnb29kLg0KPj4NCj4+IFRvIGtlZXAgdGhlIFJBUyBiYWxh
bmNlZCwgWGVuIG11c3QgZXhlY3V0ZSB0aGUgc2FtZSBudW1iZXIgb2YgQ0FMTHMgYXMgUkVUcw0K
Pj4gYWNyb3NzIG9uZSBWTWV4aXQtPlZNRW50cnkuICBXaXRob3V0IENFVC1TUywgd2UgY291bGQg
YWNoaWV2ZSB0aGlzIGZhaXJseQ0KPj4gZWFzaWx5IHdpdGggYSBgY2FsbDsgYWRkICQ4LCAlcnNw
YCBhbmQgYHB1c2g7IHJldGAgcGFpciwgYnV0IHRoaXMgaXMgbm90IGxlZ2FsDQo+PiB1bmRlciBD
RVQtU1MuICBJbiBmYWN0LCBDQUxMIGlzIHRoZSBvbmx5IHNoYWRvdyBzdGFjayAicHVzaCIgb3Bl
cmF0aW9uIHdlDQo+PiBoYXZlLCBhbmQgd2UgY2FuJ3QgdXNlIGl0IGEgc2Vjb25kIHRpbWUgaWYg
d2UgaW50ZW5kIHRvIGtlZXAgdGhlIFJBUyBiYWxhbmNlZC4NCj4+DQo+PiBJbnN0ZWFkLCB3ZSBr
ZWVwIGEgcmVhbCByZXR1cm4gYWRkcmVzcyBvbiB0aGUgc3RhY2suICBUaGlzIG1lYW5zIHRoYXQg
Zm9yIHNvbWUNCj4+IG9mIGVudHJ5LlMsICVyc3AgY29uZGl0aW9uYWxseSBkb2Vzbid0IHJlZmVy
ZW5jZSBDUFVJTkZPLg0KPj4NCj4+IFRoaXMgbmVjZXNzaXRhdGVzIHN3YXBwaW5nIHRoZSBjdXJy
ZW50IG9yZGVyIG9mIERPX09WRVJXUklURV9SU0IgYW5kDQo+PiBzdm1fdm1leGl0X3NwZWNfY3Ry
bDsgd2hpbGUgdGhleSBkb24ndCBoYXZlIGFueSBzcGVjaWZpYyBvcmRlcmluZw0KPj4gcmVxdWly
ZW1lbnRzLCBwdXNoX29uZV9yYXMgbmVlZHMgdG8gY29tZSBhZnRlciBzdm1fdm1leGl0X3NwZWNf
Y3RybCBvciBlbHNlIHdlDQo+PiBuZWVkIHNvbWUgdmVyeSBpbnZhc2l2ZSBjaGFuZ2VzIHRvIGZp
eCB1cCB0aGUgJXJzcCBjaGFuZ2VzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IENDOiBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+DQo+PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+DQo+PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4+DQo+PiBSRkMgZm9y
IGEgY291cGxlIG9mIHJlYXNvbnMuICBUaGlzIGRvZXMgZnVuY3Rpb24gY29ycmVjdGx5LCBidXQg
SSBzdGlsbCB3YW50DQo+PiB0byBkbyBtb3JlIHBlcmYgdGVzdGluZy4NCj4gQXMgcGVyIGZ1cnRo
ZXIgZG93biB5b3UgbWVhbiB0byBzYXkgaXQgZnVuY3Rpb25zIGNvcnJlY3RseSB3aXRob3V0IHRo
ZQ0KPiB1c2Ugb2YgYWx0ZXJuYXRpdmVzLiBBbmQgZXZlbiB0aGVuIChzZWUgYmVsb3cpIEkgc3Vw
cG9zZSBpdCBkb2Vzbid0DQo+IGZ1bmN0aW9uIGNvcnJlY3RseSB3aXRoIG5vIChvciB1bnVzZWQp
IENFVC1TUyBidXQgQ09ORklHX1hFTl9TSFNUSz15Lg0KDQpJIGNhbWUgdG8gcmVhbGlzZSB0aGF0
IGFmdGVyIHNlbmRpbmcgdGhhdCwgdW50aWwgd2UgZ2V0IG5lc3RlZA0KYWx0ZXJuYXRpdmVzLCBJ
IGNhbid0IG1ha2UgaXQgZnVuY3Rpb24gY29ycmVjdGx5IGZvciB0aGUNCmNvbmRpdGlvbmFsbHkt
bm90LUNFVC1TUyBjYXNlIHdpdGhvdXQgZG9pbmcgdGhlIGZ1bGwgbW92L3Jkc3NwcS9jbXANCnNl
cXVlbmNlLg0KDQpXaGlsZSB0aGF0J3MgcG9zc2libGUsIEknbSBub3QgaW5jbGluZWQgdG8gYWRk
IHRoZSBzaXplIG92ZXJoZWFkIGZvciBhDQpjYXNlIEknbSBub3Qgc3VyZSBpcyBzYWZlLg0KDQpT
bywgdGhlIGFsdGVybmF0aXZlIHRvIHR1cm4gdGhpcyBvbiBpcyBnb2luZyB0byBzdHJpY3RseSBk
ZXBlbmQgb24NCkNPTkZJR19YRU5fU0hTVEsuDQoNCkF0IHNvbWUgcG9pbnQgd2hlbiBuZXN0ZWQg
YWx0ZXJuYXRpdmVzIGFwcGVhciwgd2UgY2FuIHJlbGF4IHRoZQ0KcmVxdWlyZW1lbnQsIGlmIHRo
ZXJlIGlzIGEgZGVzcGVyYXRlIHdpc2ggZm9yIHRoZSBwZXJmIGltcHJvdmVtZW50IGluDQp1bmNl
cnRhaW4gc2FmZXR5IGNvbmRpdGlvbnMuDQoNCj4NCj4+IFNlY29uZGx5LCBYODZfRkVBVFVSRV9B
TFdBWVMgaXMgY2xlYXJseSBub3Qgb2sgZm9yIGNvbW1pdHRpbmcuICBJJ20gc3RpbGwNCj4+IGRl
YmF0aW5nIHdoZXRoZXIgdG8gbWFrZSB0aGlzIGNvbnN0cnVjdCBhdmFpbGFibGUgaW4gIUNFVC1T
UyBjYXNlcy4NCj4+IE1lY2hhbmljYWxseSwgaXRzIGZpbmUsIGJ1dCB0aGUgc2FmZXR5IGFyZ3Vt
ZW50cyBkZXBlbmQgb24gQ0VULVNTIGJlaW5nDQo+PiBhY3RpdmUuDQo+IEknbSBhZnJhaWQgaXQn
cyBub3QgZW50aXJlbHkgY2xlYXIgd2hhdCB5b3UgbWVhbiBoZXJlLCBub3Igd2h5IHlvdSd2ZSB1
c2VkDQo+IFg4Nl9GRUFUVVJFX0FMV0FZUyBpbiB0aGUgZmlyc3QgcGxhY2Ugd2hlbiB3ZSBoYXZl
IFg4Nl9GRUFUVVJFX1hFTl9TSFNUSy4NCg0KSXQgY2FuJ3QgZGVwZW5kIG9uIFg4Nl9GRUFUVVJF
X1hFTl9TSFNUSyBiZWNhdXNlLCBsaWtlIHRoZSBQQlJTQiBjYXNlIG9uDQpJbnRlbCwgSSB3YW50
IGEgd2F5IGZvciB0aGUgdXNlciB0byBzd2l0Y2ggYmFjayB0byBzdHVmZjMyIGlmIGl0DQpzdWJz
ZXF1ZW50bHkgdHVybnMgb3V0IHRoYXQgSSd2ZSBzY3Jld2VkIHVwIGluIHRoZSBzYWZldHkgcmVh
c29uaW5nLg0KDQo+IElmICJ0aGlzIGNvbnN0cnVjdCIgaXMgcHVzaF9vbmVfcmFzLCB0aGVuIHRo
ZSBtZXJlIHVzZSBvZiBXUlNTUSByZXF1aXJlcw0KPiBpdCB0byBub3QgYmUgdXNlZCBiYXNlZCBv
biBhIHJ1bnRpbWUgY2hhcmFjdGVyaXN0aWMsIG5vdCBqdXN0IGEgYnVpbGQNCj4gdGltZSBvbmUu
IEhlbmNlIGFmYWljdCB5b3UgY291bGQgYXMgd2VsbCBwdXQgdGhlIGVudGlyZSBtYWNybyBib2R5
IGluIHRoZQ0KPiAjaWZkZWYgdGhhdCBjdXJyZW50bHkgZW5jbG9zZXMgb25seSB0aGUgQ0VULVNT
IGluc25zLg0KDQpXaGF0IEkgbWVhbiBpcyB0aGF0ICJ0aGlzIiBpcyBmYXN0ZXIgdGhhbiBzdHVm
ZjMyLCBhbmQgbWlnaHQgYmUNCiJhY2NlcHRhYmx5IHNhZmUiIGZvciBzb21lb25lIGVpdGhlciBv
biBCVEMtdnVuZXJhYmxlIGhhcmR3YXJlLCBvciBuZXdlcg0KaGFyZHdhcmUgYnV0IHdpdGggQ0VU
LVNTIGV4cGxpY2l0bHkgdHVybmVkIG9mZi4NCg0KVGhhdCBzYWlkLi4uDQoNCj4+IEluIHByaW5j
aXBsZSwgb24gQ1BVcyB3aGljaCBkbyBub3Qgc3VmZmVyIEJyYW5jaCBUeXBlIENvbmZ1c2lvbiwg
eW91IG1pZ2h0IGJlDQo+PiBhYmxlIHRvIHJlYXNvbiBhIGRlZmVuY2UtaW4tZGVwdGggYXJndW1l
bnQgdGhhdCBpZiBhbiBhdHRhY2tlciBjYW4ndCBjb250cm9sDQo+PiBpbmRpcmVjdCBzcGVjdWxh
dGlvbiwgdGhlbiB0aGV5IGNhbid0IGJ5cGFzcyB0aGUgMS1zdHVmZiBzYWZldHkgZWl0aGVyLCBi
dXQNCj4+IHRoZSBvbmx5IEFNRCBDUFVzIG5vdCB2dWxuZXJhYmxlIHRvIEJUQyBoYXZlIENFVC1T
UyBhbnl3YXkuDQo+IFlldCBwZW9wbGUgbWF5IGhhdmUgcmVhc29ucyB0byB0dXJuIG9mZiBpdHMg
dXNlLg0KDQouLi4gSSB2aWV3IHRoaXMgYXMgYSBwZXJmIGltcHJvdmVtZW50IG9ubHkuDQoNCkFz
IHN1Y2gsIEknbSBlbnRpcmVseSBoYXBweSB0byBzYXkgdGhhdCBpdCdzIG9ubHkgYXZhaWxhYmxl
IGluIHRoZSBjYXNlDQp3aGljaCBpcyBlYXN5IHRvIGRvLCBvdWdodCB0byBiZSB0aGUgY29tbW9u
IGNhc2UsIGFuZCBpcyB0aGUgY2FzZSB3aGljaA0KSSdtIGNvbmZpZGVudCBpcyBzYWZlLg0KDQpJ
ZiBwZW9wbGUgd2FudCBpdCBpbiBvdGhlciBjYXNlcyB0b28sIHRoZXkgY2FuIHNlZSBhYm91dCBo
ZWxwaW5nIG5lc3RlZA0KYWx0ZXJuYXRpdmVzIGFsb25nLi4uDQoNCj4+IFRoaXJkLCBJJ2QgbGlr
ZSBzb21lIGVhcmx5IGZlZWRiYWNrIG9uIGhvdyBjbGVhciBpdCB0aGUgbG9naWMgaXMgZ2l2ZW4g
dGhlDQo+PiBjb25kaXRpb25hbCBuYXR1cmUgb2YgJXJzcCBub3QgcmVmZXJlbmNpbmcgQ1BVSU5G
Ty4NCj4gSXQncyBhc3NlbWJseSBjb2RlLCB0b3VjaGluZyBvZiB3aGljaCBuZWVkcyBleHRyYSBj
YXJlLiBUYWtpbmcgdG9nZXRoZXINCj4gdGhlIHNpemUgb2YgdGhlIGVudGlyZSBmaWxlIChxdWl0
ZSBzbWFsbCkgYW5kIHRoZSBjb21tZW50cyB5b3UgYWRkLCBJJ2QNCj4gc2F5IHRoYXQncyBmaW5l
Lg0KDQpUaGF0J3MgZ29vZC7CoCBJdCB0dXJuZWQgb3V0IHRvIGJlIGZhciBsZXNzIGludmFzaXZl
IHRoYW4gSSBmZWFyZWQuDQoNClRoZSBtYWpvciBvYnNlcnZhdGlvbiB3aGljaCBhbGxvd2VkIGZv
ciB0aGlzIHdhcyB0aGF0IGl0IGRvZXNuJ3QgbWF0dGVyDQp0cnlpbmcgdG8ga2VlcCB0aGUgUkFT
IGJhbGFuY2VkIGltbWVkaWF0ZWx5IGFmdGVyIHNjaGVkdWxlLCBzbyB3ZSBkb24ndA0KbmVlZCB0
byBwbGF5IGdhbWVzIHdpdGggcmVzZXRfc3RhY2tfYW5kX2p1bXAoKSB0byB0cnkgYW5kIGV4ZWN1
dGUgb25lDQpmZXdlciBDQUxMLg0KDQo+PiBGb3VydGgsIHRoZSBhbHRlcm5hdGl2ZXMgbG9naWMg
KEkgdGhpbmspIG5lZWRzIGltcHJvdmluZyB0byBub3QgZml4IHVwIGENCj4+IGRpcmVjdCBDQUxM
L0pNUCBkaXNwbGFjZW1lbnQgaWYgdGhlIGRlc3RpbmF0aW9uIGlzIHdpdGhpbiB0aGUgcmVwbGFj
ZW1lbnQNCj4+IGxlbmd0aC4gIEkgZGlkIHRoZSBmdW5jdGlvbmFsIHRlc3RpbmcgYmVmb3JlIHdy
YXBwaW5nIHRoaW5ncyBpbiBhbHRlcm5hdGl2ZXMuDQo+IFllcywgdW5sZXNzIHlvdSB3YW50IHRv
IHByZWZpeCB0aGUgQ0FMTCB3aXRoIGEgcmVkdW5kYW50IGluc24gcHJlZml4IHRvDQo+IGhpZGUg
aXQgZnJvbSB0aGUgZGlzcGxhY2VtZW50IGFkanVzdG1lbnQgbG9naWMuDQoNCkhtbSwgdGhhdCBz
aG91bGQgd29yaywgYnV0IGlzIHVnbHkuDQoNCkhvbmVzdGx5LCBJIHRoaW5rIEknZCBwcmVmZXIg
dG8gdGFrZSB0aGUgdGFrZSB0aGUgdGltZSB0byBzdGFydCBkb2luZyBhDQpib290IHRpbWUgc2Vs
Zi10ZXN0IGZvciBhbHRlcm5hdGl2ZXMsIGFzIHBlcnQgdGhlIFNNQyB0ZXN0aW5nDQppbXByb3Zl
bWVudHMsIGJlY2F1c2Ugd2UgZGVzcGVyYXRlbHkgbmVlZCB0aGlzIGZvciBzbyBtYW55IG90aGVy
IHJlYXNvbnMNCnRvby4NCg0KfkFuZHJldw0K

