Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EABD6C3493
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512758.792934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedCa-0003dE-FK; Tue, 21 Mar 2023 14:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512758.792934; Tue, 21 Mar 2023 14:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedCa-0003aA-BX; Tue, 21 Mar 2023 14:43:04 +0000
Received: by outflank-mailman (input) for mailman id 512758;
 Tue, 21 Mar 2023 14:43:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKE/=7N=citrix.com=prvs=437062dd9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pedCY-0003a4-Of
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:43:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac164e33-c7f6-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:42:59 +0100 (CET)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 10:42:32 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB5992.namprd03.prod.outlook.com (2603:10b6:208:30a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:42:27 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:42:26 +0000
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
X-Inumbo-ID: ac164e33-c7f6-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679409779;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=q69BJjjxzvy1g59CHA2wgDjOX1sMsS/kAJlmneorvLo=;
  b=KxEug5Nure8SWoQKqJQLHfFdPLYpX0qVp3Dek1ukMZmFblD5fRMuIyJ8
   8oLJwjvIpwxYdzmsNZKcqDImEo2r7ju8YSv4y++9FfBUSVLZV32fDIt90
   +TV1vdoVnD4gYxpbzgxK0Ju5fAvkTKxuRTOUTHLU6hmBS+aK87B5dwLmz
   4=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 104135651
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qufN8qIaxLIjdwYbFE+R8JQlxSXFcZb7ZxGr2PjKsXjdYENS1GEHy
 GUdCzzTOqveYWuncoxyPdy1/BtU7MeDzdZiS1dlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZnPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5KUGZQ+
 vkHdQkVbxusu8OPzr6EDcBF05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGMkWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv02raUwH2mAer+EpW96cBJo1a1m1coCQ9NWwSdnNbio3+XDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHbylUSwIAuoPnuNtq0U+JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNL9D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:uy6gZKMwlliX88BcT6D255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq8z+8N3WB1B9uftWbd2FdAQLsSjrcKhgeQYBEWldQtqZ
 uIEZIOb+EYZGIS5aia3OD7KadH/DDuytHUuQ609QYIcegFUdAD0+8vYTzraHGeCTM2c6bQU/
 Gnl7p6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyqIiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/L8Zan4pWfjbQ9kJl5bhHoe
 p29lPck6ASIQLLnSz76dSNfxZ2lnCsqX5nteIIlXRQXaYXdbcUh40C+0F+FosGAUvBmckaOd
 grKPuZyOddcFucYXyclm5zwOa0VnB2JRuCSlhqgL3h7xFm2FRCi2cIzs0WmXkNsLgnTYNf2u
 jCOqN00JlTU84/d8tGdak8aPryLlaIbQPHMWqUL1iiProAIWjxp5n+56hwzP22eaYP0IA5lP
 36IRxlXFYJCgLT4PC1rd52GkinehT+Yd2t8LAT23FBgMy8eFKxWhfzDWzHkKOb0oci64PgKr
 KO0altco7exFvVaPl0NjLFKudvwFklIbkoU4UAKiWzi/OODLHWncrmV9uWDIbRMF8fKxDC6z
 04LXXOGPk=
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="104135651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyRNkf/O6kinnptel4PLHadsA4Cj6D4rr+jvS2MeEb+Cy4eMVWGUarSf72ndgcLZ2wKW9BjB6MCgVjMd4jF7PFryWLUU4coSOjX0eh0YK+ajMDd0ONs3SQMrr5zRGyqHjE8bmuaP01PyGVTC7CVxyw7uNZwQFHEWRyUgB7zq92i3Ct6dAHfHkp/VemU+LkeLGTujn+BegAT0ovn37oSVJfkbfwTX3+QaLkwUnJjoEYzxWZtqD10nF8qXbTCBKGht4CL/vGycc6m6INRGJQ4ERAFqlc94VhQOhucT6m46pU6dm3gVdCKlVqZJEaO+LREA6vybghBLd3Z2UwURdu7jNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeQAI9vZlGE1dlhx/KtV9AURRZ5PbouGONNGGsznaXI=;
 b=AL6cX1y+gP3r2TSuRwlNb/KXN45xxT7yhavDIYkJGCE+FQai7o7LlTurk8ZIewU55hmPT4kEFExIxi8qKdjczY7yQSzpFFDXwkMAmdm9T5+SCAaVKpd2HZzxvmLTDkZXn3sZIAUsf+97zYm9WU0ySTGCSBv2mUrCtRnvRJ6QtuKgk+0zkxphRixmKllvhFjDQGmUhlo/xLYNvprCkGTQcdF+WH1XNzwjjM4jaRhAy2i0b93iz8IfHzZEnXnC3rAUSL1PxLZR0UK85u7Ck5E0KdgGdePWbl7HRl4yZnSwpRZ8AeptJSvFrjwSCqR+z5FyPvvBEp79e9ofPwYv3RmepQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeQAI9vZlGE1dlhx/KtV9AURRZ5PbouGONNGGsznaXI=;
 b=d06ljqdDTQXZ97UlgYPj17WjsxJPgkjBAqRIEub5gLv/EGZUF7h3bi6Nv+oMmhTb9ph4B+b3axTI57RWqOi4VkOyg8ysMmwx7OFwrPihqckqDZEnRD8kLKi+6QD/DRJ08NpGbz0ftgVS3KDnnfY8DD0O9dx8n+kkuAF9yk0tX2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Mar 2023 15:42:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
Message-ID: <ZBnCTAw3Fj/BpvTl@Air-de-Roger>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
X-ClientProxiedBy: LO4P123CA0671.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::11) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 234f2d6f-924f-4aa9-710a-08db2a1a7d78
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8UbZLiRybaDF62+tn7SEZt3s1IbqlR0v84FRPHI0Dxedwx9z83xpvyI4kNbFCjLjboy8fpbybH3Ap+00VDCpOuKqxSygB6GpF3zjP7aEAQhEfhxfmmSQIM7HF4gJa4Z1P2wnt/c/dR/hV+ecxdO58cyvWxi7NzixYpnXAzEdGcFyuf3RAWCx9Z5ITkeJDMK/pV5NfOeT58Gmcqy5ua4hiISWqWdyhCW7+4zHRdiHSXb59JVrMXbshDiIPRk59wW3WDncpORyoSESnGSFR+dtUc5uccbjcgHpzYdzWadv95WNv9BCHm3bdKbzfnI7PI4JahDOYT/qS2/oE9S7oN7ve1B4qFSmJa/VdgZsktOhWbQbt9XHQ93OD4nTOX8D3aTU8iB87a2v9p7MhakREFkjyyp4Ja6kOQl7goOIPQqW21lYBim5lkCAaEf6h/R+IB0YAIP3upkV01piwe2sv3p4OFvfvSXedcaptSJsnJwb2I/zPvdqr1k2ZJanVGYcGGk5gofSsJ0qQBj7cIT0Q44w1m9KLKK1FJTIiGTSSUR0cMsy/vhz9TxXNc14GOzJ6hDCKqBA6vnvlYp1YOW4Jfov3ILmdykB/F7UEjTPcwHrSVZvw+khFh0hPmIJBre4jzr69mObTpTfjZMBfFUbN+/whA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199018)(6506007)(26005)(9686003)(6512007)(6666004)(6486002)(4326008)(316002)(6916009)(66476007)(8676002)(66556008)(66946007)(478600001)(186003)(54906003)(8936002)(5660300002)(4744005)(2906002)(41300700001)(82960400001)(38100700002)(86362001)(33716001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDVBeWJXREtXY3NhdVczMUF0Q1dlN05SendtUHpMSytDT3locXFhcCtVa2tj?=
 =?utf-8?B?bm1TMk5lcVJDYWZZVnhZZGtHTHVmdHMzQ1JOTjZaY0JWLytoRUNLWVk3akpk?=
 =?utf-8?B?Wk5wOGxRZGtOSk0xNUp3SDNXaUlEVDNwL3lMdTZtOW95KzF4d2RqYmpkSjVa?=
 =?utf-8?B?UnkxUFRSeUhIRkh6TVVXQ2xxZTFvVG5tcnQyZ1JtczVVMXRoekRYRXV6bjA0?=
 =?utf-8?B?S2JpbGxiNlNGNGhwcGhXRFZJZWMzaUNDZDJKZFpDaUo3SVFWUUVUdG9jV3Zz?=
 =?utf-8?B?K1NFYUFnVzdpMVRqZnhINDh4TkdYQ0xoSjlnQk9kV1dncThJTXYyOUFCKzVv?=
 =?utf-8?B?TnFjdGFqbGtlQ3YySFc5Q1lmQjBCazZvcjlwRXlRVTVpQmJLeEFnUkZrdC9q?=
 =?utf-8?B?R3libkt6SC9OTGFxMjFCaXNUSVErQ2Z4L2YxVTRkeUNkV0NtZ1Y4eU42TnBj?=
 =?utf-8?B?VFRCa3pMUVV3MW8rS2M5YTcvNmxGY1F1cGZ5aEJLdjZaTksxZnVVYW5QdEQv?=
 =?utf-8?B?WU04TU1ySGhkMEFLT1hiclVPY1ptNjgyY2VDSmo1cDJ4SzJmKzRRUFZKY0Vw?=
 =?utf-8?B?cG56M2pvbmtsaXEydGVkVzBWUHNaV0RqdExtL0VTS2NaYUNuNS8xTTVxb3lk?=
 =?utf-8?B?VFYvWGZIUzFPMFJ1SUhraTQ2bmRmYmxLYXM3d1pVVElPemkwR1VFK05wOVVp?=
 =?utf-8?B?clhYdlh2R3VHaXlWbnJ4Q3AvQVJpa1kvcEZ0c1UxY2ZCemFRNkRBNFBWTHVK?=
 =?utf-8?B?TXl2UXRWcmJ6K1NVY1dDN2wvSkdYRTRRWDFJTEplV0VEZmdLQVR6UEx3RUVl?=
 =?utf-8?B?RGNHclM4MWE2OWltREEvL2YzZmxSbVdlcHlOMEh4UEVXSGpQWUUvSG5HSmw0?=
 =?utf-8?B?cENLZ1dBalJrMUNpKytQRFdhQjRHU0ZFa2RsWnRjRmJuMHpmb0VXM25ZaGVt?=
 =?utf-8?B?WW9sVjdIajgybE9PTEVQNXAzUFhNNDVpMjZLYVJwekpNQ0J0Um81VHJQWnh2?=
 =?utf-8?B?bXphZjQ4Qll2aXBzWnBjNkxxZnhDUm5vYno1QllIaSs4Z09OK285Z0FQQXFV?=
 =?utf-8?B?MmRyN0t0NVFoTzZ4U0pNOUdXRXZQdE1sWDFLbTFZQkRHbnl2aHg5Q2JXUzM2?=
 =?utf-8?B?SnNTTmN5N2I4NzFteWdsUzdXQmMvTW1taXRGYmFOMnV1QUlXdnZFbUxxT0k5?=
 =?utf-8?B?VlByT0I4QzhQTU5rQUhFMXBKU0J1cWVUQWVUS0RsSDJpQzdFQ2pDVWh5U0Rl?=
 =?utf-8?B?bThkVnBISlV1dWJ4dkF2Uld6WVh2WTExNm9SdFprNFdQV0RDMWJ0WHhOR3JG?=
 =?utf-8?B?K2FzcGZvbFRQdzNuOWRKcUdpT0R6Q2Nac290elEzY2lCU1ZjTGtiS0wxV3JK?=
 =?utf-8?B?Y3Jqdk51TDJDNTZZekhvUWk5a2RvUGJzODVvRStlaHUwckM3ZGNRN2dRbFIz?=
 =?utf-8?B?WjN0VitEMjRqYnk4S0JML2czZk82bml5dFBSYnN2TjVRdUJSd3A0WlVQL3Fv?=
 =?utf-8?B?WlFDVll1dzU4TnJEOXp5TWtPcmJxSnllWE9DcVpqM1VwY1FqdkFHZkR1Y0ZR?=
 =?utf-8?B?SmtFNDFKVGp1VU41dXdCOWVhZW5lSXpzWWZjaGVyQjd6WTdHaU8zYXpBWHph?=
 =?utf-8?B?MGdGTkZuT0tkcUl0cHNPZldBY3dKU1lhV2V0VTZJcTRyKzZ4cWpxSVFXTWZU?=
 =?utf-8?B?a2tWTDZFdWQ0MDdUY1hyNEM2QjFCSjVrc09rZUt4VldTaEwyQko3ZlFBQXVY?=
 =?utf-8?B?bllDaXNUSkg4WDRNT1Rqb3RweTZSVndvVFRXd21zVEhpeEZkdVJUTjJzV0du?=
 =?utf-8?B?dzIvd2tjTWd0MXM1em1lanpXbzV3Yjh3ZGN3TzhIN01rT3JWd1RVTzQ5bzdx?=
 =?utf-8?B?clZZTFR5ZGpjeXhyUUJ1VWZHRFZvNXRRV2JiK2hWbEVtUC94QnJwU0Fpaitu?=
 =?utf-8?B?VCtoVTRZa0NJZ2EwaVoxU3dON2dodGI3UkdzaE15cjZpQURFMDNYd3hFRVo4?=
 =?utf-8?B?ZU4yRml5bEVVYVN0RGdwZytMMWNpR0tvN3RDaVlUV3BBOUlsTUtoc2VmVzc0?=
 =?utf-8?B?WHFwMFkzbTRQNUczdDcyaEJMeFo5ckRKWG5Kcm5jNGJ2TjN2aU5WazhaR3lI?=
 =?utf-8?B?bEgwZk5MSEpaMFRtQlhRdE4rNXJFRzA5RGIwb0U1LzE4WndmYit5Z0Zsc0pR?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MB4tY3yD/zQLsAUcwdEuMkxDgfg7de+ZRiHotH33Yc0cWY0SZweb0dmwTMKrBG0LNRjnY8I0HSlbLhIar0PDkwJEiAVmwbeCJy+rBJK8qicKAMSiNf85cm2NPBlXzVeau9mjuyXCYG2rdea2occhhPO/fR69cKfT3AGTvEEMSJHX2dOEUUWVJubxvrI/MasmaRfUCSUmPDBImK4Kjckiz/LzrvNxYFGxM2qCFXExE0CsiyWoqWjNCASWWPAcc2f6aFFyCujfbwfAfkll8F309UnKTPtsFy2z0NNVfFgtpe8Ic+CkQpIiLSp6fL1WKdNNDZZmmfdfszVx4a/sc2yqwl/uysX8HsxSmlA3s3ajLQSCarAFGx9gH7W5nPgQCyrQur6HQLmCLoexHP+ZRvwofjry503EPesYeL/+b0pToPlAmSRB2VLgQLYSyakxtbef/IhQc7IVAI1bIdqtrgtTBfvqHa0P+0HwH2PTDgMbSxqK10JM2PHgW2vpbaPUbvNR4+DL60p7tmz8EHExi93DMPhX04T1U/RWL0xygnf1Rp9zGEAZS76Nzbemgnt9Y465Wyqjaaut26ADDkhNe4oDC6FO2NQMhTvEuA6A7KGU6Wfp/dz8vA+OYumktq7eDJwZ0GAk70JQMn6iZ53i++ORbkLeBpyMNW1/tVFuR6ykMvNi1+8NOmKxvfwsub6fsB5IQNtJj/54eNnX7j+YnWXhHNsPuQkwV/NovjIHQeLVxkLNg0Rk/xpIUZrh0Ohsmb2/MRFyqWu0ZRCSGVUCbTFfJhOkObh6oK4BfJLHDIkdtGRD+TVrJTBd6LnhtSC+wC6m
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234f2d6f-924f-4aa9-710a-08db2a1a7d78
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:42:26.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Li+jZJQpALo3aQedWQuPr8gowIeWx7C5QI+dO7opWcfBQZTsELtI6R+KFYAtpFDJhAEHzfkhzrpu/L9hmE+25w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5992

On Tue, May 26, 2020 at 08:49:52AM +0200, Jan Beulich wrote:
> Respective Core Gen10 processor lines are affected, too.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
>      case 0x000506e0: /* errata SKL167 / SKW159 */
>      case 0x000806e0: /* erratum KBL??? */
>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */

I think this is errata CML101, I would add that at the end of the
comment.

Also you seem to be missing the '806ec' model (806e0 case)? (listed as
'U 4+2 V1')

Thanks, Roger.

