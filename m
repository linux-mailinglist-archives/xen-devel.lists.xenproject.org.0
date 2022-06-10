Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08374545E48
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 10:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345923.571606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzZlE-00055X-LN; Fri, 10 Jun 2022 08:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345923.571606; Fri, 10 Jun 2022 08:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzZlE-00053I-Hn; Fri, 10 Jun 2022 08:12:52 +0000
Received: by outflank-mailman (input) for mailman id 345923;
 Fri, 10 Jun 2022 08:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kdog=WR=citrix.com=prvs=1535499d8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nzZlD-00053C-08
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 08:12:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d428037-e895-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 10:12:49 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jun 2022 04:12:45 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6615.namprd03.prod.outlook.com (2603:10b6:a03:388::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 10 Jun
 2022 08:12:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 08:12:42 +0000
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
X-Inumbo-ID: 1d428037-e895-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654848769;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bmMrXtdP7KrwxUTAv7qdDLC9sk211vTy7IMy+N9vuRg=;
  b=SdJUgmfkNW8Y7Q1ynMaOJ7UmybwJvhH3NjVwWXyP1vZUzKL5zf5GLdFH
   rLTzb3bvg4Jg4F2+fv5HhyXKcVv8PdrQwFrJ+N20FN1tayYV3vPY2bUhg
   UIsiM8/mc0jiwqIDbQSXpOrEzv/uM3zEO2Nz2Mx3531TmOKw0N3ImwqWw
   4=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 72646867
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jprdpKxSV+KKKocpCjZ6t+dExyrEfRIJ4+MujC+fZmUNrF6WrkUGn
 GNMWjrTO/reMGehcoxyOt/n/UNXusSDmIdrGwJurSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY22IDhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl5JKuVxlzObb2vaciYx94HzMjJKB+9+qSSZS/mZT7I0zuVVLJmq0rJmdpeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtacG+OTvYAwMDQY36iiGd73Y
 cYDZCUpRxPHexBVYX8cCY4knffujX76G9FdgA3P+/ZpszaMpOB3+LzvbOrzdOapfNtqu3qTi
 WHl/E7LHQ5PYbRzzhLAqBpAnNTnnyn2RYYTH72Q7eNxjRuYwWl7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQv3qsrhMaHd1KHIUHBBqlz6PV50OTADcCRzsYMNg+7pZuGnoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd17UZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:3Tig86H0a2zoOLHrpLqFsZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnZ4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlXFtyssHfrWG1SYczHgNkHmpDp1L/sqq
 iLn/4UBbU315oWRBDtnfKi4Xi57N9k0Q6e9bbRuwqenSW+fkN6NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjx0C3fLFuHoO5l7ZvtX+90a1wbh7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm1kxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XX50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLqzNV1wg2TwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.91,288,1647316800"; 
   d="scan'208";a="72646867"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljlthibyRFjM1Kjnx5yuzGeGBA3dQpkOZ2Cly2Zm05tKV2lM0WVUo64MssIP+BCBwQTyk2F8g4TQ/MKm1gX+Juceh0BFLFwqPaufh5qowTYIMdfYlZJp1T91CgmpK4xw8bx5BlCeKIr3kw4hhGtmEsJkwGQyoyV9Co6MZyxjarblHHXxhJUNAuciEYS4f3b3O641lrkrzOdcYPPIKesoF0xjbE6MvuD6jjpDLrgehJ5euOlutsBkRqFkVg99WHkioyQDIu5j931TMgmnZlDzGmUY3zZrSztnyHtZMUv+4wrYSsDmcng+PfbkZo5E7NkIQKzxOURArlffyhBc+t4CPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmMrXtdP7KrwxUTAv7qdDLC9sk211vTy7IMy+N9vuRg=;
 b=kzU5K9yJtoLNwxrv3M/1yQrMXws7o0iIopiWgSG2vFFExFe/EQFkFy4qbBJaBuU/par6Ssj09V6ZY0R+TOI/PXCTCPVLXCRVrn52RW8G+stLE9m5sAmsUGXkuMHeAWxh8nM9B7pnkPl4bj+25vUqCcMQiJ4hqmdfxe4VjX4yfoVkSHAvV6lk4vCwmxVEWbBljYdte2Ft5JymwCKUY+vVMSrgULZxWL95EWJh9NUqtjp/txD0PVEyQSVJP/2R2+HqnJSPpLArb8I7YyPzBhoit/J47SvEm2nEx+E486EeywLI9BduRBrjVD8sIyIQdPbhIdVOQ1td70kMb8uN7wvi6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmMrXtdP7KrwxUTAv7qdDLC9sk211vTy7IMy+N9vuRg=;
 b=nf1XqEzVduzaUI2KF040VpEjvzOkMTy5w4noAVCEigf+AS5kx4Z16W3KRYxUwr3R2ob3b+W6fn/wOQ0Psg7OGCXi1nDgLDW+UiyWq5OS2uCNi8/H7X8WKG1M/E/An/pVtTLucZgUicN6HjdEsEiqigMn4gsqJzUorKQRb40h350=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/mm: account for PGT_pae_xen_l2 in recently added
 assertion
Thread-Topic: [PATCH] x86/mm: account for PGT_pae_xen_l2 in recently added
 assertion
Thread-Index: AQHYfJt5YVvowoL3VkeMPGEizKI7eK1ISn8A
Date: Fri, 10 Jun 2022 08:12:42 +0000
Message-ID: <93283a6c-0a5b-aa73-7632-21cc9b4cae62@citrix.com>
References: <ee7e7e1f-8d3c-0d8f-24ef-c281b09faa25@suse.com>
In-Reply-To: <ee7e7e1f-8d3c-0d8f-24ef-c281b09faa25@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8792d92a-eaff-47a1-a1a6-08da4ab8fe44
x-ms-traffictypediagnostic: SJ0PR03MB6615:EE_
x-microsoft-antispam-prvs:
 <SJ0PR03MB661539A9F1DD25F3698417B0BAA69@SJ0PR03MB6615.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Neil/DChQ8OwnZ1/jucIlnUNrWFd1+R++LcTHqCewF9oGRvnyOWYl2vKQHJZi9ohJxCXqole2/QZDlYznf16/HpPMOeVevSPFYbmcqLnp6nSnorayONfD9dY1pl7tDQ98Eswn+MZbLGoxs9UwaiaGSfYwt7CazKBCzNkJHXPmubtldoXj9mls1NFJ2ePG5zxrR6+V+aN4T5TBQSqxEFGlTZ+hS0CpnBmrkuiPC8G48rhDigPeuIfS5z3P0m66JXjqiLdU0BYCQoJ0oFBZPb2w44BpRcrTHqE3NkOEpkXiUxMVlFWZSVtFXewDI+kw2meeVZ7s8Tz3hKLM+kM/AGS7E3Qx1j9h4qhbYkmezjn+sgVC7nZ1yx7LDJFUBbHuDOxDQCwYtFq0B4rzp3Tzp2CAXAwZBHaJz5w9HLdpxl+nEqFRV4rZa73MShas0CTDRugZHp6oJkeZK76M6uzNTs3cUzmO2OfT1OALQtklv087DHoclohtWT/lz1JtSegsWn3oSWWwhHHqipoYfa6bXqyuPkyNeEUSqNWOxljwzCJvyQ/KKo5yX8VGF8ZFNwz88Jzpd3dODycxpiUWSIKvcpH8tgDfJ0yGBb5PMLabfW0HQVmtJrF1sTeis7zVRmTBERSVnoto7ZeZZo7LS0gb52aBsNkAzbb2L75VBeDiQyd7s879N9XUwtOXqTUHvG92xwH9gASeCGs8ZVwaHWl7EassvcD8MON2YFA2PQedRY6+LJi04FRkFmyJusTsgJtZfteO3yVCVCtybuOSFyVcMTu+w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(2906002)(55236004)(82960400001)(38100700002)(31696002)(26005)(71200400001)(6512007)(508600001)(6486002)(110136005)(54906003)(38070700005)(6506007)(122000001)(8676002)(4326008)(316002)(86362001)(186003)(8936002)(91956017)(66946007)(5660300002)(66476007)(66446008)(64756008)(66556008)(31686004)(107886003)(76116006)(2616005)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVhXd3Z5V0FrVUZweHpkaVRXNWJqMGo4dTZtQldpRXNsSGpvVkl2UVZPa2Zs?=
 =?utf-8?B?NjMvQVd2anlDN013TVp5bk4vamthMDJzM2VQK3BYaGZUVnFQR2J5emFuWGpI?=
 =?utf-8?B?cFU3ZzByMmlxR2hYTDdXVzgxR0Z0OTB0Y0JyMnBuQXBDQi9qS1M5U1NyOEJp?=
 =?utf-8?B?cXpIYlhBaC9LUDFJV1NsbVJPS1JjSUxjSEZnNXRuZDhyaDBSYWFWc2J2U1lo?=
 =?utf-8?B?aWRaL3UvTlJ1Q3dleFhlNExxWExGbGNiTHBVamVXWW5rdUlDNkw1T2U2elNp?=
 =?utf-8?B?aWtDNUF1cGFtRVhSQnJlSzJmbGpHSzJ3NE1VQjRCTVpPMCsrdVRGNVFxNHJs?=
 =?utf-8?B?eGYyUHQ4QTB4STdmaUExekM5eDliNU8zZzkwQkdjNVRBVUJGUE12ZExpYTFw?=
 =?utf-8?B?OSsyR2ZLTktnVTg0SUlydUE4a0lodDFzZGN5T1VXaC9CcTcvTDVtWU9OaUpq?=
 =?utf-8?B?dGdOdFdGckZCU1paWWtveGZ0UzdLWU5TeDVBREI3eHlEcHFyQi9oMS9ZcE4z?=
 =?utf-8?B?SmI5Rm5WZWhOUnBkREtHaldxUTQ5Vi8rV1VORHNwaCtkci9aUlYwbWtkWklW?=
 =?utf-8?B?aXNSSk1PT01vVElJQ2J6WFlkcWJ6UmpPU1daai9MeGYvcFAxcVE0OEhJZWJ1?=
 =?utf-8?B?dlZTaVdvcndwOGdJYWtQaGhvV1FIV05nWWRJYUVicU9yZmFCWWhNTHh2UHpz?=
 =?utf-8?B?UjlLaVBsckduOEpGcXc1VVdEOThCdmZZZkMwdE9WS2owWlRibUNxZUxJMzNW?=
 =?utf-8?B?akRicC9JNG5NYzg0by93eStyOUVtQlZoMC9VK2Z3eXVzSFVWNUlBM2NwV0R0?=
 =?utf-8?B?aGZ2aURsZEJtSCtxTEVFWGgxSXJLSlJrK1AvSHM2Zjh0TnVucUsvdWYxaURk?=
 =?utf-8?B?TnVIVndyRkp1UWxHOTJuUm54bnVWOEkvU3hMNkl5Z1RDMzdzTGtMQi9EazFv?=
 =?utf-8?B?R3pWc05ETk96SFVaWHhwMndRZDB3bWRwMk9vbVBHYS9qQWFnSFc1L0YyTWFi?=
 =?utf-8?B?dGFYYkc5SDRkZTNUSk52SVkvL2NCSGRXZll2YWZ5WWVTR0RrTUVZWFhXVEFY?=
 =?utf-8?B?VFhvbDNvWWV1RW9JeHAvWDlaWlJzdjNxMlAwTUJlMGM4MFlpbjVhTmRMWS9p?=
 =?utf-8?B?RUNmQ0pEeDJwcnhGUEgwMU5BOUFpU2FCMnBxOGQ5ZjJsa1YyNXJpZ1BqcTB5?=
 =?utf-8?B?VWZrMU5YRDhSY1dIT2FJWHgrMU1OODNIT0VUVVgvd2J0ZWFaVHByeVFUcjRo?=
 =?utf-8?B?UTljOWJlUXJFY0lIWGlNREdPeUtIdjlKY2YvVmJyNkJlcTNvS2M5Y0V0ekFn?=
 =?utf-8?B?RFNaWTNpaFpCazZINS9vS2dmMW43UmxqQmluRDU2UWh5MFNTU29IVU1IU21w?=
 =?utf-8?B?VHdYMWwvSFR5R3o2ZEZIODFlUXEzSERvMVVoMitTaFdmUVhSZjg3bjhMdjBC?=
 =?utf-8?B?L0l2UkFEQ2hWd3JoUnBjVUh2cEtSN0pkWkNUeWJNbFNSSG5qbVpIZDAxeDlK?=
 =?utf-8?B?bXpUWWg4Ym1OOTRvVmNzYTl5aVNFNUZDSlpvSWJ1bXM3d2orSmRhVVk4dWYr?=
 =?utf-8?B?Q2NMU0lmWjVLZVM0TEpMNlE0ZVZNdllqYTBVZnY3ZkpvdjE0a3dlMEZtc2RS?=
 =?utf-8?B?VUkwZzF4M3p1QURGMmdORjFQVzJ5RGNSVmhvY24rRThYSUdGNHlFWkdpUWQ1?=
 =?utf-8?B?OXlZMHBseExXY0lUR2U1d2ltU0dTNkxiOEVBN0xpSkVWQ01ITzdTSTlWdlFF?=
 =?utf-8?B?TUNwVVdEZTN0eVJwVGhDbzlrL3o5aEc5MHd1aFFtWXV1bVdZVEkrV1ZxdVIz?=
 =?utf-8?B?eTZpNTliVW5ldlZRSWVWMlVmT2VpQ29Kcm13dFR5QlBERGlNTWhNdDVDeDBF?=
 =?utf-8?B?Y2pOcDdKdk53TjdoM1AzbE1ZNG9KZG84MHpFdnJKSjVabHlMWkEzQVE4bTRH?=
 =?utf-8?B?aVlCQjZ3OER1aHVGYldIR3I5clhIUzJPVGJQR3ljOUhtMmdaM0xNa25NWVFC?=
 =?utf-8?B?T0VhSE9LaDZveEhoTUNsR3ByS2xiZGpnQVRWa2YwRGVNeTd6SE9NMEhuc2dk?=
 =?utf-8?B?VDNWSFViclZkSUNRUlpyY0tDZnFIeExaMi9Xa0VwVlY1QXR6cXBPT0I3Wklj?=
 =?utf-8?B?TDRCMUhBQzl6bkRxNlNNcVpWZlVNekRWbE1HRUlyOFBDNUlmUUFzajRHMHpa?=
 =?utf-8?B?TWlFcHFPZG1JaXUyUjhTTVF0Q2pFcTBuN2JUYmg3VGNyaTFzcnNtdlVyM3ZB?=
 =?utf-8?B?VHJSNzRUNmRVSmhhS0IvSUsrVzA5VmpUSDFUSTRqV3hvbndadHhxdUFaVVAw?=
 =?utf-8?B?b1BlMHQxTVFSRjIvK21HSlk0VmFoQkh1cWdjRnZnSGdIMWYxcGF3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6628AAAE3B825F408DE2372EC4B54B48@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8792d92a-eaff-47a1-a1a6-08da4ab8fe44
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 08:12:42.6070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oM0viW35mrvFXqjScR0qUA1G2ro4+2FFgjVEGsK4/GM7FQUjFaklL5NOYCYrrcHyCr8U7LUcU+2ZLwb8YIKkRcXcaRhjA2dWYKMuz9OJs2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6615

T24gMTAvMDYvMjAyMiAwODoyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdoaWxlIFBHVF9wYWVf
eGVuX2wyIHdpbGwgYmUgemFwcGVkIG9uY2UgdGhlIHR5cGUgcmVmY291bnQgb2YgYW4gTDIgcGFn
ZQ0KPiByZWFjaGVzIHplcm8sIGl0J2xsIGJlIHJldGFpbmVkIGFzIGxvbmcgYXMgdGhlIHR5cGUg
cmVmY291bnQgaXMgbm9uLQ0KPiB6ZXJvLiBIZW5jZSBhbnkgY2hlY2tpbmcgYWdhaW5zdCB0aGUg
cmVxdWVzdGVkIHR5cGUgbmVlZHMgdG8gZWl0aGVyIHphcA0KPiB0aGUgYml0IGZyb20gdGhlIHR5
cGUgb3IgaW5jbHVkZSBpdCBpbiB0aGUgdXNlZCBtYXNrLg0KPg0KPiBGaXhlczogOTE4NmU5NmIx
OTllICgieDg2L3B2OiBDbGVhbiB1cCBfZ2V0X3BhZ2VfdHlwZSgpIikNCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpwYWVfeGVuX2wyIGJlaW5nIG91
dHNpZGUgb2YgdGhlIHR5cGVtYXNrIGlzIGRlZXBseSBjb25mdXNpbmcgdG8gd29yaw0Kd2l0aC7C
oCBJdCBhbHNvIHJlbmRlcnMgYWxsIG9mIHRoZSBjb21tZW50cyB0cnlpbmcgdG8gZXhwbGFpbiB0
aGUNCnN0cnVjdHVyZSBvZiB0aGlzIGxvZ2ljIHdyb25nLg0KDQpJJ20gYSBsaXR0bGUgY29uY2Vy
bmVkIHdpdGggdHlwZSB1c2FnZSBpbiB0aGUgbm9uLWNvaGVyZW50IHBhdGggdG9vLsKgDQpJdCdz
IHNhZmUsIGJ1dCBpcyAoYWxvbmcgc2lkZSB0aGUgSU9NTVUgcGF0aCkgYSBtaXNsZWFkaW5nIGV4
YW1wbGUgdG8NCnN1cnJvdW5kaW5nIGNvZGUuDQoNClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpJIGNhbid0IHRoaW5rIG9mIGFueXRoaW5n
IGJldHRlciB0byBkbyBpbiB0aGUgc2hvcnQgdGVybS4NCg0KPiAtLS0NCj4gVGhlIGNoZWNrIGFy
b3VuZCB0aGUgVExCIGZsdXNoIHdoaWNoIHdhcyBtb3ZlZCBmb3IgWFNBLTQwMSBhbHNvIGxvb2tz
IHRvDQo+IG5lZWRsZXNzbHkgdHJpZ2dlciBhIGZsdXNoIHdoZW4gInR5cGUiIGhhcyB0aGUgYml0
IHNldCAod2hpbGUgIngiDQo+IHdvdWxkbid0KS4gVGhhdCdzIG5vIGRpZmZlcmVudCBmcm9tIG9y
aWdpbmFsIGJlaGF2aW9yLCBidXQgc3RpbGwgbG9va3MNCj4gaW5lZmZpY2llbnQuDQoNCkl0J3Mg
bm90IHRoZSBvbmx5IGluZWZmaWNpZW5jeSBoZXJlLsKgIFN0aWxsIHBsZW50eSBvZiBpbXByb3Zl
bWVudHMgdG8gYmUNCmhhZCBpbiBfZ2V0X3BhZ2VfdHlwZSgpLg0KDQp+QW5kcmV3DQo=

