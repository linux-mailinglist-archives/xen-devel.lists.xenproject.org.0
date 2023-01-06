Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E675865F924
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 02:32:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472250.732413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDbaN-0000KM-Ue; Fri, 06 Jan 2023 01:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472250.732413; Fri, 06 Jan 2023 01:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDbaN-0000Hp-R0; Fri, 06 Jan 2023 01:31:55 +0000
Received: by outflank-mailman (input) for mailman id 472250;
 Fri, 06 Jan 2023 01:31:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDbaM-0000Hj-4a
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 01:31:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4003a05-8d61-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 02:31:51 +0100 (CET)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 20:31:47 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6665.namprd03.prod.outlook.com (2603:10b6:303:120::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 01:31:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 01:31:44 +0000
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
X-Inumbo-ID: e4003a05-8d61-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672968711;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oh7cyCArkL503G2e+TUqgklZst87qK1v5xznyrpur2s=;
  b=dFZJpfuvOJiVwU5WqMAiQTjAKijQbnopO1bT8Ah9mAOxvNQhL9Mqi27i
   A2f5C5OAKBcMuOZReBtkp/1YpZBl8li+O35nAUAsb0niE4UCx17G3WZIx
   jHF/VwSBVgGPn33eJoh3JjKgrBl3f24GKklNCjC2aYyACuPqWV3gi4O/G
   8=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 91404169
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jbWz1qpII069CFmoh6826T8AuR5eBmIpZBIvgKrLsJaIsI4StFCzt
 garIBmHPquMNmegftp/PYSyoUxTucTTnYRnGlQ+qn0zEn4b8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHzyRNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADAPLSDTuOeH+4yEG8l9pNR9A/uwf5xK7xmMzRmBZRonabbqZvyQoPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYWMEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpr6Iy3ATNlwT/DjUnCBjnsainm3TnVtZiK
 xEx9nEJ97MLoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSy2ETgYKykFfyBsZRcE5vHzrYd1iQjAJuuPC4awh9zxXDv2k
 zaDqXFkg61J1JFSkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshUZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:AsAjkK6cP2IM/bTnMgPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="91404169"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRj2BAisd7GPfX3Nws1+dtWFtkLJFDkvpUXCBubddKlJdTAv8Z56z9VHEG9ym54fFMNk/FPpXe0Zr2Ps5aNgz84K5inC02LqICYMDvpl9pqfxQT00LhX7rTXk6ZSovMUKonpwvlcKkldDIxT1dydhaaWEc1DyHx5sRS6/j9KA89klMULbpApmMLNFSvVLB02KNafnq899eXQ8lW1wAUO6kdmdXW9ZnBvS/GVUEn/ayxfB5zTLRxHDWF6ssW10JBYgVH2d6KpkqEyx7JqYgBW10ufc+kouWClpOq2x0rwQ86N8BcdPAUPnifPdNWD++YN0DXMVZI3Amj046W7JWFtig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oh7cyCArkL503G2e+TUqgklZst87qK1v5xznyrpur2s=;
 b=gEKVuBrohVqmcbbARxKYbTQ1342wV/LX2GtC6XwNlw4OitPFc9nQUyWQb+SHRmxprVg/L17PJzic/uBKsU0YLuvhqdR6D7p3cJ+amVGs6RupfQJzIah5l05yDB1JI1fwWjn96sw4iHQA0LWJku5iajRwffOOIuj97Yfj1EgG5qXdsG1lam1enWgvuEnglzu8No9kIPnhvseSY9DDjs3kmFAJptICkBULQLB8DfGT45r7PU0EwCEyH9fsrBPJYqBEWawqZi5pnvLFacOXMSQjgRJh0XsUl/QpUnt1vHx4XLcuuAEGj8jCO/SlgDN8AFX/6H1cYHs7qv6+0dHmzGmrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oh7cyCArkL503G2e+TUqgklZst87qK1v5xznyrpur2s=;
 b=DFAuZDlztl3HQpQtG1Nh645LwUi0r2f+g3pejWomrFwSgLDSXYkOYLh7hMBuPezz/zBajvJ2Fd7yprAqILdttcnJp/S+Cm47P0euzVKJcIX3xwQjeLg5Kk9nOUa365pRgCZ/G07q7QZL4qfDF3PZP2Lhii0a19t0nHpF8bf8IJI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 07/11] x86/shadow: L2H shadow type is PV32-only
Thread-Topic: [PATCH 07/11] x86/shadow: L2H shadow type is PV32-only
Thread-Index: AQHZIR97UU3x5E5JME2c1R2RCJMcMa6QmwUA
Date: Fri, 6 Jan 2023 01:31:44 +0000
Message-ID: <a3b7631c-07e7-455b-3531-c33ce435521b@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
 <2743393d-852d-b385-9eba-e22806b1c4af@suse.com>
In-Reply-To: <2743393d-852d-b385-9eba-e22806b1c4af@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6665:EE_
x-ms-office365-filtering-correlation-id: 21858d6e-9db4-427e-65b5-08daef85c538
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /W6+L2nbaZOeWCAxt7r7gH8X6X8ewwOj6Ag0mhwdkg4XezhhAbaJtYEiSASlDMGDrTke7Gc2oLZ88ad9H2eTwib9Hi7PAjCpSc+ja0yvrmpLmJ0kfHfcxULltxwvdGfJkwZkLzQHtlkWs8ZLYhWxi3SNZB9jQwdK2OZA3zu0pk4wzTAtR0wi0JjNMmrE+Qu3AdkJYqP/7dqMo+pgFVSvboPaMQXa7Z3jzI24Dl34PDPfUBHEfQXnxB2NyaYZQBy+gcIB6cMzJBzFjWaCHTu4zMomWQk9H2g+up+YJI4J4qqO0ZWbJJWV7AkzoSvs92a3r2KlxQdMjv6/bTAwUjOpiyKYpVMNyZSw+goOtF0sg+yEzBm3YRZ1YOXiJi0d7EagRapcEYqOXIVgerNE5LnrDLOj3UbrdQtnGAamXSvJ3ptq0e8Hppz//D69k69qIwBWV54PAtA4JeEVbECv6FbzaGG1sCQJRWlbWSlIUPyywP57U+IpEopIJtx7fmwKzvbZucJL59iGhEIru+qY7CHPJOOo55xRckN5+bS4Y6RDyS64q5hX8euDaV0j61lti0PIYKm7oQ6hvrOdCSkwPpAiiX6LsPAXLcy6YPA+XQeRbQwYjLPKh0O0v0WFU6XToI9r94IJPVX3JeZmNuMbswXguY5ca8EbploKbUFgsB/omXO8IkERh5hwf0I9cMO11MNsQCRZjWiuKDAc7eo79rvLzaCdGY4IaY9oAwc03ve8FaBFcbu/ws7/W5WZ0zjdv3EMDDLG/lAgeVu8qNwjB2w00Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199015)(316002)(31686004)(5660300002)(76116006)(91956017)(66556008)(2906002)(41300700001)(54906003)(8676002)(64756008)(66446008)(66476007)(66946007)(8936002)(4326008)(110136005)(107886003)(6506007)(478600001)(53546011)(71200400001)(36756003)(83380400001)(26005)(186003)(6512007)(2616005)(6486002)(82960400001)(86362001)(38100700002)(122000001)(38070700005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGVsWGRDOVduS0piK0xMRnYvaVFvSVd5b0tkbnZ4SnVXZ1l0Q251SDhYTC9B?=
 =?utf-8?B?dTdEdmZuS1JjVGQzQXlvR0RROGJVemFuVHB4b1UwTWszT3RZWHpGWTBYcXFu?=
 =?utf-8?B?Yzg0TE1zUTR5eWJZcS85SzQwNEExRUJqZGp3c1cxQU9DaXo5UzdwNE96WDUx?=
 =?utf-8?B?cFQ5b0tueFdWKzRtaGo0dyt4dVNBRVdaOVZCTVFnRTNhNUFFS0ZBalRDenho?=
 =?utf-8?B?dnpiWkFuNjFmT2ZlZ1JUSEZ4Y0YrVVRWL0pOU2tnN1lkR3FxUkN4Y09qZk1W?=
 =?utf-8?B?TFdEVXRwNnhKRGlSWC9HSmtUT2MxcXNsNm9sb01mdEFoV1RmdFdOVDlDNFF1?=
 =?utf-8?B?cjRaZjhwR3AyaGQ0czkxWFA0bkYzTVhUbHBNeGRZK2xlYW4zTWpna0dwWEF5?=
 =?utf-8?B?Y2YrdXNyNkhJbk1PYkZ5Tm5KNlQyNnlCbDkxR1hFRjRpc1NuR1JnREpWb0Nq?=
 =?utf-8?B?b041TTVBbDhZMDAwN3ZKRzMrZ2g2WTI5cEJUdDZpVUhoSHBrbFgxMmxXWkhU?=
 =?utf-8?B?TTd6MTN0ZzArTGlBQTM4MkRtRU9aOFZqTlVDRmNRY0RtekZqanhqMDhiRXMw?=
 =?utf-8?B?UmZsMUpVM3FSSmVrVWNHU3B5MmZqVHJ6WW1mMGVmakdoZmxzZVJjY0hJQ0Jq?=
 =?utf-8?B?NlFyS3E3YjZSTGdTb09hRDNCMjJMREkyZ1RGVTYydE83dzJpQkI0TERKd3Rl?=
 =?utf-8?B?d3Q4c214Yk0wN0pBV1pQei9VeFJJRExZU1ZzbU1xZ0xnQUExMFBSaWE4YWlk?=
 =?utf-8?B?RW5CdGxRS0tWZDZzdFdvbnhxSkhMMWxzS3lDT0JJUXhCVXl1bzZ2eWNsVGRR?=
 =?utf-8?B?dVlUOG5OOW56WDBTbHlQd2NRWmlpTXRFaGl6bVphcTJCWWFDUmRSdXUxbno4?=
 =?utf-8?B?bHpaVGlNS2tWQzZhUUZRZ1JjVXo2U2FYNXBqWDVFRk15aFRlL2ZLOHVEWHA4?=
 =?utf-8?B?dldUanBLN0VxdWkrZGJrY3RlRUFYV2w3TFZuNkROVVZjbWtVdEFtNUt3ck91?=
 =?utf-8?B?a3dNc1diOUU2eFdEb2E4eDV3TkZPSHBielhlWkhmckoxYy9XQnJtWjd6RFpq?=
 =?utf-8?B?YWFXSklTT2xvbnl0SjFxTGd5TmNuTnVxN3ArcmlmaHQ4WnhIMC9LWm92dlo0?=
 =?utf-8?B?ODAvQkhrZ2g3SDdheStpSzhlRVB6Y2hoUjFyd0p6d1lEU3dHRUFjUklEK3VN?=
 =?utf-8?B?all3RzdjSkFiTExyb2NrVE9EVEd6d3dPMDMvRkE2QlQ3MWFZNHJoUEM5VklP?=
 =?utf-8?B?WGNFNXVnemJveGJVa1JZTFlCTjFHUEk4Ly9RT1lKQ3E4RnRFcmg5UkxZREpX?=
 =?utf-8?B?ajNNdGU2a3o1QU5kS1dsd2puczJRVGJrMW8rTnRyTDV4anpXNEFGUjRLVi9M?=
 =?utf-8?B?OU5OQ2dra3JtSmNmYVlVMjlSamlVakN6UkFyaTJUL2x2NlhiVW4wUUk3UmtR?=
 =?utf-8?B?RTJOREw3RExZS1lqQkxuUDRJazR3OFpZVmVES3ZsZkd4U2dBRFBCZXF5bWxh?=
 =?utf-8?B?TzVNMi9oMERoNWl2ckJ3MTlBQUJ5T1FPdmJCY2dGcDJHbnhWUnlzUCt0MXg3?=
 =?utf-8?B?cXM2T3VFMEhyQUZhYXhRNTFoY2VmcWo0cndYNkhidmIvN2JTdUtTVC8za3pM?=
 =?utf-8?B?OU9WQTBOenlBeU44VENLZm5IbVk2bEI3b2FnbnpFdXJnbjBMU2g2UHMyZWtP?=
 =?utf-8?B?cW1hMWhWR0hBaEhJQXpjd1ZzUzBnMWhzQjRrM1lPelhuaENCSWVydEdlSVBO?=
 =?utf-8?B?L0ZiOEtPQyt1blQrOFJRcHpHSXdkOHg0WjQya0J0SmkxcmQvZ0g0ZVhqbGxF?=
 =?utf-8?B?dXlLeEdKNTB0aGphTUNsS0FZcXhYSWpaclVtNE0zN1FHb0l5aGJyTm9BNDB0?=
 =?utf-8?B?L3dhL0V6MGVHLzJLTXhnU0lBUlhsNjlnUXpaVlBwSkV0dWxLMWU3OWxiQ1pN?=
 =?utf-8?B?bFgyMitZS0hHNGlWU040OGYvUGlUeFRzeWhHU0tSUkxpd1U5a2tXZFByMnNV?=
 =?utf-8?B?RFJNNWRhbHdLRytnVkJ0RXdwb3pLQXdqN0tnREx0YmQvWlZ3Rk5TOFN2M2Uv?=
 =?utf-8?B?dUxLcEU0NTU5ZDBwNU9KK1cza1ZDTkVZZWhLS2s2ZjA1S09iaWp0L1JSMWJS?=
 =?utf-8?Q?IxHkPB2beWiZR8Qcqi7kn0gkL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0814466D35FD6349AFD19F49B8F92DAE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VEh2B/EXa/D9x0sSy96Sb7t+FopKeAPWJ6gi7zsx2dRQOIZ+hilPBKs7xJFP9mZdn0MW33/kkSj7yo3DfbEzyTOSD5a410+P2dthzhqYyu71VlpFe8In+FVvFcdaNRiTJQhlGhR5N7kYHpJHnE8KMo0t5OADWZAz5SN72C+qF6YRFXOVjL3GSWYCxr2ti5u10YEmhrjZaDdxPuEauP83Fg1bET5KF+WLDq2s+xVgwx1tUkKpoIVHiqrqmRKqLG/BFP7zyvAJ4CgHeX1Z2xz7MWeSXkzdEvF9RHUdGW40dXroWQ26v+DnoV+S/AT+Qg8XPHpglaUDGww38hwLn8g4qLFGQ9icDd5bp7+QFoC80bund82cNlpWKqcA6EBglRxaBJ2LKbG4+y+veDOmbd4mU7Thr04dWRLA7WfM0Dm9K3XbFIgy/+XVjNY1HDuOYR7PRYzd2sqs69Yev6CrQc6cJCkyLvcNFYlkI6rO049wgn3OEV1OvMPUM5jRl14JKihPjxF4yBfnILHaJFQ2lngzjB04JrvbXk85fP/+lTdBNi+nEYcjksLYXanS/rhCMYIuudxDTo5rV4+5YdSqfRPH8AWEvQa6crALFfSmWZDd+eOQ/ZjF9JlTBupCpgDtswB+0etDOVieUJHWsc56cFsE3ldwiNYBo5o4AiSE3eSupwkbDsmZdLdN/RtNofbAAB6uEhMruOhPWXW6vLVoBXrl5jKnWdt0b70ZTmrkP40/oQvzA99KF1fp+hNqS8V9yYRQqeKUByfyrwL0lnAttWO8yE/DDDbfoR8WudPHsphoJQ3+Jw7xJC4dGKQr2vwaB9/yAVRYiA70zDLAIICbB0SMYg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21858d6e-9db4-427e-65b5-08daef85c538
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 01:31:44.4530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: twvfdl8yv7tvoLkiLODHPcpFMr7m9YHlAYshIkgA+Z4Qmti2AM2B0/CpWS299sjZc8kvTe+EUF0XikOXmYI0oHEgan9gX4lacSkGKvNGQIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6665

T24gMDUvMDEvMjAyMyA0OjA1IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gTGlrZSBmb3IgdGhl
IHZhcmlvdXMgSFZNLW9ubHkgdHlwZXMsIHNhdmUgYSBsaXR0bGUgYml0IG9mIGNvZGUgYnkgc3Vp
dGFibHkNCj4gIm1hc2tpbmciIHRoaXMgdHlwZSBvdXQgd2hlbiAhUFYzMi4NCg0KYWRkL3JlbW92
ZTogMC8xIGdyb3cvc2hyaW5rOiAyLzQgdXAvZG93bjogNTQ0Ly05MjIgKC0zNzgpDQpGdW5jdGlv
bsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBvbGTCoMKgwqDCoCBuZXfCoMKgIGRlbHRhDQpzaF9tYXBfYW5kX3Zh
bGlkYXRlX2dsMmVfX2d1ZXN0XzTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEzNsKgwqDCoMKgIDY2
NsKgwqDCoCArNTMwDQpzaF9kZXN0cm95X3NoYWRvd8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyODnCoMKgwqDCoCAzMDPCoMKgwqDCoCArMTQN
CnNoX2NsZWFyX3NoYWRvd19lbnRyeV9fZ3Vlc3RfNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMTc4wqDCoMKgwqAgMTc2wqDCoMKgwqDCoCAtMg0Kc2hfdmFsaWRhdGVfZ3Vlc3RfZW50cnnC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNTIxwqDCoMKgwqAgNDcy
wqDCoMKgwqAgLTQ5DQpzaF9tYXBfYW5kX3ZhbGlkYXRlX2dsMmhlX19ndWVzdF80wqDCoMKgwqDC
oMKgwqDCoMKgwqAgMTM2wqDCoMKgwqDCoMKgIDLCoMKgwqAgLTEzNA0Kc2hfcmVtb3ZlX3NoYWRv
d3PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDQ3
NTfCoMKgwqAgNDU0NcKgwqDCoCAtMjEyDQp2YWxpZGF0ZV9nbDJlwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNTI1wqDCoMKgwqDC
oMKgIC3CoMKgwqAgLTUyNQ0KVG90YWw6IEJlZm9yZT0zOTE0NzAyLCBBZnRlcj0zOTE0MzI0LCBj
aGcgLTAuMDElDQoNCk1hcmdpbmFsLi4uDQoNCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gSSB3YXNuJ3QgcmVhbGx5IHN1cmUgd2hl
dGhlciBpdCB3b3VsZCBiZSB3b3J0aHdoaWxlIHRvIGFsc28gdXBkYXRlIHRoZQ0KPiAiI2Vsc2Ui
IHBhcnQgb2Ygc2hhZG93X3NpemUoKS4gRG9pbmcgc28gd291bGQgYmUgYSBsaXR0bGUgdHJpY2t5
LCBhcyB0aGUNCj4gdHlwZSB0byByZXR1cm4gMCBmb3IgaGFzIG5vIG5hbWUgcmlnaHQgbm93OyBJ
J2QgbmVlZCB0byBtb3ZlIGRvd24gdGhlDQo+ICN1bmRlZiB0byBhbGxvdyBmb3IgdGhhdC4gVGhv
dWdodHM/DQoNClRoaXMgcmVmZXJzIHRvIHRoZSBzdHJhaWdodCBkZWxldGlvbiBmcm9tIHNoX3R5
cGVfdG9fc2l6ZVtdID8NCg0KSSB3YXMgY29uZnVzZWQgYnkgdGhhdCBhdCBmaXJzdC7CoCBUaGUg
c2hhZG93IGRvZXMgaGF2ZSBhIHNpemUgb2YgMS7CoCBNaWdodA0KDQovKsKgwqAgW1NIX3R5cGVf
bDJoXzY0X3NoYWRvd13CoCA9IDEswqAgUFYzMiBvbmx5ICovDQoNCndvcmsgYmV0dGVyP8KgIFRo
YXQgbGVhdmVzIGl0IGNsZWFybHkgaW4gdGhlcmUgYXMgYSAxLCBidXQgbm90IG5lZWRpbmcNCmFu
eSBmdXJ0aGVyIGlmZGVmYXJ5Lg0KDQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVs
dGkuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMNCj4gQEAgLTg1OSwx
MyArODY2LDEyIEBAIGRvIHsNCj4gICAgICBpbnQgX2k7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICAgICAgaW50IF94
ZW4gPSAhc2hhZG93X21vZGVfZXh0ZXJuYWwoX2RvbSk7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXA0KPiAgICAgIHNoYWRvd19sMmVfdCAqX3NwID0gbWFwX2RvbWFpbl9wYWdlKChf
c2wybWZuKSk7ICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gLSAgICBBU1NFUlQobWZuX3Rv
X3BhZ2UoX3NsMm1mbiktPnUuc2gudHlwZSA9PSBTSF90eXBlX2wyXzY0X3NoYWRvdyB8fFwNCj4g
LSAgICAgICAgICAgbWZuX3RvX3BhZ2UoX3NsMm1mbiktPnUuc2gudHlwZSA9PSBTSF90eXBlX2wy
aF82NF9zaGFkb3cpO1wNCj4gKyAgICBBU1NFUlRfVkFMSURfTDIobWZuX3RvX3BhZ2UoX3NsMm1m
biktPnUuc2gudHlwZSk7ICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICAgICAgZm9yICggX2kg
PSAwOyBfaSA8IFNIQURPV19MMl9QQUdFVEFCTEVfRU5UUklFUzsgX2krKyApICAgICAgICAgICAg
ICAgICAgXA0KPiAgICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAgICAgICAgaWYgKCAoIShfeGVu
KSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
DQo+ICAgICAgICAgICAgICAgfHwgIWlzX3B2XzMyYml0X2RvbWFpbihfZG9tKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAtICAgICAgICAgICAgIHx8IG1mbl90b19wYWdl
KF9zbDJtZm4pLT51LnNoLnR5cGUgIT0gU0hfdHlwZV9sMmhfNjRfc2hhZG93ICAgIFwNCj4gKyAg
ICAgICAgICAgICB8fCBtZm5fdG9fcGFnZShfc2wybWZuKS0+dS5zaC50eXBlID09IFNIX3R5cGVf
bDJfNjRfc2hhZG93ICAgICBcDQoNCklzbid0IHRoaXMgcmVkdW5kYW50IHdpdGggdGhlIEFTU0VS
VF9WQUxJRF9MMigpIG5vdz8NCg0KUGVyIHlvdXIgb3RoZXIgcXVlc3Rpb24sIHllcyB0aGlzIGRl
c3BlcmF0ZWx5IHdhbnRzIHJlYXJyYW5naW5nLCBidXQgSQ0Kd291bGQgYWdyZWUgd2l0aCBpdCBi
ZWluZyBhbm90aGVyIHBhdGNoLg0KDQpJIGRpZCBwcmV2aW91c2x5IHBsYXkgYXQgdHJ5aW5nIHRv
IHNpbXBsaWZ5IHRoZSBQViBwYWdldGFibGUgbG9vcHMgaW4gYQ0Kc2ltaWxhciB3YXkuwqAgQ29k
ZS1nZW4gd2lzZSwgSSB0aGluayB0aGUgTDIgbG9vcHMgd2hhdCB0byBjYWxjdWxhdGUgYW4NCnVw
cGVyIGJvdW5kIHdoaWNoIGlzIGVpdGhlciA1MTIsIG9yIGNvbXBhdF9maXJzdF9zbG90LCB3aGls
ZSB0aGUgTDQNCmxvb3BzIHdoYXQgYW4gImlmKGkgPT0gMjU2KSBpICs9IDc7IGNvbnRpbnVlOyIg
cmF0aGVyIHRoYW4gaGF2aW5nDQpMRkVOQ0UtaW5nIHByZWRpY2F0ZXMgb24gZWFjaCBpdGVyYXRp
b24uDQoNCn5BbmRyZXcNCg==

