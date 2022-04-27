Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4857E5113D5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314567.532680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdOE-0002ly-0p; Wed, 27 Apr 2022 08:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314567.532680; Wed, 27 Apr 2022 08:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdOD-0002jG-Tp; Wed, 27 Apr 2022 08:51:13 +0000
Received: by outflank-mailman (input) for mailman id 314567;
 Wed, 27 Apr 2022 08:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8dk3=VF=citrix.com=prvs=109ad7ccf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njdOD-0002jA-2C
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:51:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e424e74-c607-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 10:51:10 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 04:51:07 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BYAPR03MB4038.namprd03.prod.outlook.com (2603:10b6:a03:7c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 08:51:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 08:51:04 +0000
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
X-Inumbo-ID: 2e424e74-c607-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651049470;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bU/9Sn70oi4SD9AvXpyG3UJzes5PrW1s7e/YT2xyo2o=;
  b=gik0NKtT/i9qtJLkb7twvPK09oaqf1yGEYJjjH8Vjs7/4EDiK4viBWRS
   78dAdulIoM0x7Tlr4igko9RDiNCCxZ4PW1T/okRSZ/c3BYES8SNTQ9zsA
   ipOPKi1YB0zi1/JTr3R2Vn6p0GQcjUmbT4mNyqdJs4c8syIJ8K97xTbnT
   8=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 72476703
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uyq+G6trxDl9gwQ2ku/ingCegufnVFNfMUV32f8akzHdYApBsoF/q
 tZmKTiCafjZYGrzc4siOYzk900A7ZSDy98xTFY6+S1jEShB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/X5
 4upyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8GE7zcwLkRVSUAGnBmLZ9I3eDNPEGw5Jn7I03uKxMAwt1IJWRvZcg037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IImm5o1qiiHt6HD
 yYdQRNpYA7NfFtkPVAPBYhltOypmmP+Y3tTr1f9Sa8fvDKPk1IuiOOF3Nz9edWGHfwPtGGjh
 nPK7Tr+PkBDd8fF1m/Qmp6rrqqV9c/hY6oRGaO58Lh2gVSV7m0VFBASE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Z8hMcOscY3QXkm0
 wGPltawXTh36uTNGTSa66ueqi60NW4NN2geaCQYTAwDpd7+vIU0iRGJRdFmeEKosuDI9fjL6
 2jihEADa38716bnC43TEYj7vg+R
IronPort-HdrOrdr: A9a23:LOPDn608itE8oJ3ujNSzCgqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="72476703"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlN5PrO6UYGb/C8dVTtRnRfEMaO0mN1UQjzRiLC2OdyT94UXmtZ6bNe9cmckdSYTCUCZBJUamqPRPiMAvFhi8BefGfMpGoiI/4UZU3yDcKwxv4D6cO7yy26AXbbBGR1y30l5HZN+O+rw1F1VuuGps2DmKjG/LE2Ojlurk4EEeFGJKvIec4O/25imdIFZqzJLQwfd1Z/kEJQiS31EdOb8KL30H3vF2SeLzoJm170ae+AkYvlTaEMfi3fbgfKwjm9qjDioTH+JgscErT9DampJsPdsNB85wwxBZLtgoTOogIWKnX5mBLHB118y5WCStPIADskPdB8G+lOWUfWINNB8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bU/9Sn70oi4SD9AvXpyG3UJzes5PrW1s7e/YT2xyo2o=;
 b=I+nyq7bCc3/oms19XeCzDpGIxH0Hnl1C9OIWoAf8AniqWHhHZ7HGVUcuT114C58RYj/qjbV5J+SwmgTxYOQQ1xlT0B8mCA9Vv6fLSFkb9/1yRCY44rQq5YBzerZeYtXzvndT/GOZxGk6sJOi7PeJPWPVJAn3aOpLkTTTUcoOJcIpeXi33V6LrHUxI4N4laKVbtfJeuZtPBAkohTvtXUICZZHt7tm0IPVW44mEfNgly92PI1cvDASDnP5uT6RggRc3JX1liQHtPAQIJFGPnPt5fhE1P//JOjc/SCecl7uKh7O2NxJVJxLLKTwg3jK3nglODPqpYrHldRyo93R5K/uFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bU/9Sn70oi4SD9AvXpyG3UJzes5PrW1s7e/YT2xyo2o=;
 b=jG6yYCwR7DIxJHb9is0+HknnuXEbQkdi6q/otxHHpxNI6iDQwvpq5Szg4ZguWXVYll6Vxa2M7yEcldkK/iVGRRakb0IOt2t/jAHQHZc54NyXkrHR1hEiPT2PnZvaTV7+M03QfxPIIIc9BTiSqm0SjkWhnQZE/3KKW+Y79E0D+KQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Kevin Tian <kevin.tian@intel.com>, xen-devel
	<xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, "Beulich, Jan"
	<JBeulich@suse.com>, Edwin Torok <edvin.torok@citrix.com>
Subject: Re: RMRRs and Phantom Functions
Thread-Topic: RMRRs and Phantom Functions
Thread-Index: AQHYWZZDIrEkmq9fL0+3qLNT2+7QyK0DHAnAgABYo4A=
Date: Wed, 27 Apr 2022 08:51:04 +0000
Message-ID: <3e5b0cff-bcc1-580a-1fd3-8e87d2d50b31@citrix.com>
References: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
 <BN9PR11MB5276C91F31AA5119CD2B1B038CFA9@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To:
 <BN9PR11MB5276C91F31AA5119CD2B1B038CFA9@BN9PR11MB5276.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7f0cd39-a6ad-4087-c594-08da282b0fd6
x-ms-traffictypediagnostic: BYAPR03MB4038:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs:
 <BYAPR03MB403816E4613B7DE46BFBDDF0BAFA9@BYAPR03MB4038.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TYpMI8HCx+aC1Wc/ltwrqRCJlURDGtoSN29q2xdSMn9Io9nUtgj5E5oUWB+RU/DuvVoYZbXhig5u8YEZjL+EX6qT8e8cQ39HZ/0ulrd33RKR4xdTUZIDNmU97qm9XEooy3OHs+ZZxXtIq1xOP7eM/n89fEsi8yB7oCISheR8hHI28PuFAl01wijAGrGN8sRnNpNkMlzX7DB6ex8c5wQjR6LVR0xMYlpjAfkmIexyY8ilOu7Fwh9FK6q6owNUDf5B+MVKdQmPMk/J4RK9lxaDW6koQbG7xF3HSA3eqgjVqW9zlAL0lzNte9sPTWslkk0tRmEXHTGNcUQvDMERJzA0GQZM3EvC1DxbSfH5+xelEdN0vSXrFAoU7TH+DQhn2frg86xUk9xvF7xsaSubt/l5YMensPESjhD5GCmnN23PJQup2Z/GMi++Psr5alt/DGbi11TZ5QwzoYBseb7Mu7unuSAqmd+YS6zs9d8hK6T5r4Zy3TTWjwORYn7wHfuXF0ZV3+7lYjtrFNXjnivjfnIF59LA36ku5uJvKKiaUnX52Z+gaQy3f3hy36Gx62yLVO73HrajLwXkA3S2rJI1qQzQVmAeN4uQa0qBgen3QnBhN65T/dr051PQjBzAcgyhvK59OesSH6Prfbb5d5fTY7lusvhWIh8U0akDoN1G1p+dJcqAjvA3qjGgY0txH49Gb+Dwv0U5qrpZv6sjbjTPa3wKK6sGwPxE5DaDGkeRX02JBNjN7irC7rqgoiNXwTVwn2La5XL1pgvHSiHVEpcgJo8y9Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(2906002)(5660300002)(6506007)(54906003)(38070700005)(38100700002)(6512007)(26005)(31686004)(8936002)(36756003)(107886003)(2616005)(83380400001)(186003)(6486002)(508600001)(3480700007)(71200400001)(76116006)(66946007)(91956017)(86362001)(316002)(31696002)(64756008)(66446008)(66476007)(66556008)(8676002)(110136005)(4326008)(122000001)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXlKSGFNcjdOWGZTUXJSN1ozdWw2cUlDMjRvWml3dXJwTkNCaEtYTUxvRVl5?=
 =?utf-8?B?d3AzWkRSQlJuTHdDdEcySlltTkp1bVZSV1FMOU9VMnFWc3FRajEwUUM0L01l?=
 =?utf-8?B?cGhucmFsN2NHR0dacXFWemtLR1psd2cvNGJDaU5NL3FLazRod0Iwb3pvZkJI?=
 =?utf-8?B?VWUwVmczYWJibU8zT0hLZmdpMm1vTzNxRXF2amE2NDlrVjNja2VsdEZtdzYv?=
 =?utf-8?B?cFdoU1RUcStVRzVSODR1MEFmV28rYVA0M0d2R2crUVhOLzZxanFCbmMrckhD?=
 =?utf-8?B?NmlGOVlOdWRVM005aUE1WmZTWWEyOUVkK2tNWURDYXdSa1A3UUlTY2wyZDR0?=
 =?utf-8?B?M2ZKTmVpRDVQKzBMN2lWUHBmM1QzazJJUXNoZWo0YjVNL0N1NEpEUjZxZU1Z?=
 =?utf-8?B?U0VoZ0dMMXp3ZzQ2Q0JabXk0NVU5bUR0WWNHYlNwL3NHTXpEZFNjeVhQd243?=
 =?utf-8?B?N21Vb0R0WWpZV3NRM2didzllZkdJYzROeDVsQm5GcmNCblFHSTlMc1ZEd1hr?=
 =?utf-8?B?UThtckdVMEhmczVrb0NISjNyVEZaREVmRnI1aDQ2K28vUWltcm5vanRmWkJu?=
 =?utf-8?B?Sys1VE9ySWU2MkFHUGhJRnFzRGVPYW9kMmh4Q1FVejUybk8zc3MzVlFsR1Qw?=
 =?utf-8?B?NkdmWUZYRVdpZHU0bFl0ODR0VlVrVE5QQXZGajFGNUV6Qm00ZnpQdkJKL0E2?=
 =?utf-8?B?ZHFGeUJScUI5cm5pc3M4Qmp6V3lES3pTbkN0eVY0VGZEM2F5NEtpZnFieTVE?=
 =?utf-8?B?cnJPT1ZYU2trN1d4bzd1bkh4NzhxNnlDUklVSWZ4MWswaUQrY0VIRkRVZytp?=
 =?utf-8?B?d0VKWWcrazE1VXpnTnMyMllsWm1ORThseUFQY2pnMVFnU0dMVjVVUCtrMlNh?=
 =?utf-8?B?cERWU0l6NU5IYjJPOCtDRlpYenBSYmlBQjE0cXgwRzJ3eE1xc0g0bEt5VERi?=
 =?utf-8?B?aEo0ODZ1SEhtaG5BdUxuNWp0YjJPaE1jMlJORGkwMUx2N3hqWm0waWVSbFVv?=
 =?utf-8?B?dnRvQWZuQlF4eHJBaDEwWEh3MmVya1ZjaTJrbnlmZEFKdTFyUVJaOHFJTzZH?=
 =?utf-8?B?ZE5ZSW55TEh5a21CK1NUZ3lXcFQ2bDNud3FKN2NMV1RLVUtCc3BySkJjeVlZ?=
 =?utf-8?B?aGNLK3N6NW8vb0FkR01XdGxVWTVzaVp4cm85ZlI5cnc2UzRzYy95d2ZJNkxQ?=
 =?utf-8?B?VEMzWENYNk1yK2w0R2ZyVWFlNVJ1Um1pN2V3T2pWYm9HNHJmLzNReDJWdnNE?=
 =?utf-8?B?cUJsbk90Mm5ac3crN1hlRXcwTFBqQkVuRWg1NndJTzF5bFRHUG4zZ2Fxdkcw?=
 =?utf-8?B?Zi9tMktUT2xueGVqSmV3T1UwYWJjQVBDMFBpQjBaYTRJeTB1NFpKOHNZUjRL?=
 =?utf-8?B?WEVWejAyMkZOVG9VUWhCN1FqWENyVmFnNnFkeUc0SllvVkpXRWVyN3plc2xK?=
 =?utf-8?B?cjJIVmNCYjc3aGc4bk1wV3duM1VBc1BSc2F6bnBacWlBaGEzeFpKUDVxU1gv?=
 =?utf-8?B?MGZUQ3pvUFN6OUdIZjVMdzN1ejB4VVY5c1I0TUxSalUwbE9NNUU4NWN0WFFT?=
 =?utf-8?B?TU9kbjdlUWJyRlEzZnlqZ3VMM1NUWFI1MUwyQ1lPSjMwaVdaZDl4bjhCdkt3?=
 =?utf-8?B?eC9qaTNWNFJoYTJuSVYrMGxmL3k5Qisvald3TGFIaWJPc1RIZVhWYVdHT3Fk?=
 =?utf-8?B?MHpXWjRrTWFmYWhaL1FteVh4VXF4Q3dCRzNGeUU3QUROSEFvSC84S21VNUlz?=
 =?utf-8?B?MDUxUWhHcmJmc1RPNXYzQmsxNVllYjZWNkNVY2hsY1J2SlJvMm11cEhIaTNN?=
 =?utf-8?B?NHcxMi9BUFowQTVDdHhET2V4Nk1HUjI1Nkp5UjdkWlIxcE5jYTloOEY4WGda?=
 =?utf-8?B?NllaT2ltRVNhSEpiYUJ4TUVzN2toRng1K0UwNU1RbjVvMTZoakZCTzk5d040?=
 =?utf-8?B?MEM5cXlBRU5KUWhzRkIzK3RsWlh1bzhFQWprc3o0RUxOdnNyMTlQSHhwSXJO?=
 =?utf-8?B?bklrZzk0S1V2NEVVcmMvU21iSnQ1QUhOZkhBd0I4eUI5bGkzbnNFVUlOTE5j?=
 =?utf-8?B?Z0NXV3B6MWV2MEp6d04yL2lWZGlqRUpCK08rRmVrZWNYR0xDdkQ0OGZoSVoy?=
 =?utf-8?B?ZE5xaGI1OTBtK09xUzJRaGJvdXZ6ZnpCR1VDQUs1N2lZZGxyZWVIU2FlTmU0?=
 =?utf-8?B?SEZ4bnp5UW9zY0orTVFEUUwvRlFlcGZDOXJoOTUzbTdrWGhyaDJhcE01aGpC?=
 =?utf-8?B?U0RnOGwrcWthcFI2TWVmbG5EQTZxZEVLZm9SaDZHanBPOXpra016ZUdBd1h1?=
 =?utf-8?B?K3JSdGp1cjJIY3pheFRYNkM2UVBvVzUyN0o5dWkrMVNPanZOTFJPMEcySmtj?=
 =?utf-8?Q?VMmYg3DnnVffWWhE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCC06F06D4A7414C83044B1642F0A27B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f0cd39-a6ad-4087-c594-08da282b0fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 08:51:04.0159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BimzCMDgMX43qx3yQq+61f8SaT/gWCbueoGFQ4sF+NEkTl5CjI2gSMtMujh1xwHnOhczS1/l/eLky2JlKOBkOAfILfeve3FxTChnc60N8sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4038

T24gMjcvMDQvMjAyMiAwNDozOSwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+PiBGcm9tOiBBbmRyZXcg
Q29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPg0KPj4gU2VudDogV2VkbmVzZGF5LCBB
cHJpbCAyNywgMjAyMiAxOjUyIEFNDQo+Pg0KPj4gSGVsbG8sDQo+Pg0KPj4gRWR2aW4gaGFzIGZv
dW5kIGEgbWFjaGluZSB3aXRoIHNvbWUgdmVyeSB3ZWlyZCBwcm9wZXJ0aWVzLsKgIEl0IGlzIGFu
IEhQDQo+PiBQcm9MaWFudCBCTDQ2MGMgR2VuOCB3aXRoOg0KPj4NCj4+IMKgXC1bMDAwMDowMF0t
Ky0wMC4wwqAgSW50ZWwgQ29ycG9yYXRpb24gWGVvbiBFNS9Db3JlIGk3IERNSTINCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCArLTAxLjAtWzExXS0tDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKy0wMS4xLVswMl0tLQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICstMDIuMC1b
MDRdLS0rLTAwLjDCoCBFbXVsZXggQ29ycG9yYXRpb24gT25lQ29ubmVjdCAxMEdiIE5JQw0KPj4g
KGJlMykNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCArLTAwLjHCoCBFbXVsZXggQ29ycG9yYXRpb24gT25lQ29ubmVjdCAxMEdiIE5JQw0KPj4gKGJl
MykNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAr
LTAwLjLCoCBFbXVsZXggQ29ycG9yYXRpb24gT25lQ29ubmVjdCAxMEdiDQo+PiBpU0NTSSBJbml0
aWF0b3IgKGJlMykNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcLTAwLjPCoCBFbXVsZXggQ29ycG9yYXRpb24gT25lQ29ubmVjdCAxMEdiDQo+PiBp
U0NTSSBJbml0aWF0b3IgKGJlMykNCj4+DQo+PiB5ZXQgYWxsIDQgb3RoZXIgZnVuY3Rpb25zIG9u
IHRoZSBkZXZpY2UgcGVyaW9kaWNhbGx5IGhpdCBJT01NVSBmYXVsdHMNCj4+ICh+b25jZSBldmVy
eSA1IG1pbnMsIHNvIGRlZmluaXRlbHkgc3RhdHMpLg0KPj4NCj4+IChYRU4pIFtWVC1EXURNQVI6
W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6MDQ6MDAuNF0gZmF1bHQgYWRkcg0KPj4g
YmRmODAwMDANCj4+IChYRU4pIFtWVC1EXURNQVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2Ug
WzAwMDA6MDQ6MDAuNV0gZmF1bHQgYWRkcg0KPj4gYmRmODAwMDANCj4+IChYRU4pIFtWVC1EXURN
QVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6MDQ6MDAuNl0gZmF1bHQgYWRkcg0K
Pj4gYmRmODAwMDANCj4+IChYRU4pIFtWVC1EXURNQVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZp
Y2UgWzAwMDA6MDQ6MDAuN10gZmF1bHQgYWRkcg0KPj4gYmRmODAwMDANCj4+DQo+PiBUaGVyZSBh
cmUgc2V2ZXJhbCBSTVJScyBjb3ZlcmluZyB0aGUgdGhlc2UgZGV2aWNlcywgd2l0aDoNCj4+DQo+
PiAoWEVOKSBbVlQtRF1mb3VuZCBBQ1BJX0RNQVJfUk1SUjoNCj4+IChYRU4pIFtWVC1EXSBlbmRw
b2ludDogMDAwMDowMzowMC4wDQo+PiAoWEVOKSBbVlQtRF0gZW5kcG9pbnQ6IDAwMDA6MDE6MDAu
MA0KPj4gKFhFTikgW1ZULURdIGVuZHBvaW50OiAwMDAwOjAxOjAwLjINCj4+IChYRU4pIFtWVC1E
XSBlbmRwb2ludDogMDAwMDowNDowMC4wDQo+PiAoWEVOKSBbVlQtRF0gZW5kcG9pbnQ6IDAwMDA6
MDQ6MDAuMQ0KPj4gKFhFTikgW1ZULURdIGVuZHBvaW50OiAwMDAwOjA0OjAwLjINCj4+IChYRU4p
IFtWVC1EXSBlbmRwb2ludDogMDAwMDowNDowMC4zDQo+PiAoWEVOKSBbVlQtRF1kbWFyLmM6NjA4
OsKgwqAgUk1SUiByZWdpb246IGJhc2VfYWRkciBiZGY4ZjAwMCBlbmRfYWRkcg0KPj4gYmRmOTJm
ZmYNCj4+DQo+PiBiZWluZyB0aGUgb25lIHJlbGV2YW50IHRvIHRoZXNlIGZhdWx0cy7CoCBJJ3Zl
IG5vdCBtYW51YWxseSBkZWNvZGVkIHRoZQ0KPj4gRE1BUiB0YWJsZSBiZWNhdXNlIGRldmljZSBw
YXRocyBhcmUgaG9ycmlibGUgdG8gZm9sbG93IGJ1dCB0aGVyZSBhcmUgYXQNCj4+IGxlYXN0IHRo
ZSBjb3JyZWN0IG51bWJlciBvZiBlbmRwb2ludHMuwqAgVGhlIGZ1bmN0aW9ucyBhbGwgaGF2ZSBT
Ui1JT1YNCj4+IChkaXNhYmxlZCkgYW5kIEFSSSAoZW5hYmxlZCkuwqAgTm9uZSBoYXZlIGFueSBQ
aGFudG9tIGZ1bmN0aW9ucyBkZXNjcmliZWQuDQo+Pg0KPj4gU3BlY2lmeWluZyBwY2ktcGhhbnRv
bT0wNDowMCwxIGRvZXMgYXBwZWFyIHRvIHdvcmsgYXJvdW5kIHRoZSBmYXVsdHMsDQo+PiBidXQg
aXQncyBub3QgcmlnaHQsIGJlY2F1c2UgZnVuY3Rpb25zIDEgdGhydSAzIGFyZW4ndCBhY3R1YWxs
eSBwaGFudG9tLg0KPj4NCj4+IEFsc28sIEkgZG9uJ3Qgc2VlIGFueSBsb2dpYyB3aGljaCBhY3R1
YWxseSB3aXJlcyB1cCBwaGFudG9tIGZ1bmN0aW9ucw0KPj4gbGlrZSB0aGlzIHRvIHNoYXJlIFJN
UlJzL0lWTURzIGluIElPIGNvbnRleHRzLsKgIFRoZSBmYXVsdHMgb25seQ0KPj4gZGlzYXBwZWFy
IGFzIGEgc2lkZSBlZmZlY3Qgb2YgMDQ6MDAuMCBhbmQgMDQ6MDAuNCBiZWluZyBpbiBkb20wLCBh
cyBmYXINCj4+IGFzIEkgY2FuIHRlbGwuDQo+Pg0KPj4gU2ltcGx5IGdpdmluZyB0aGUgUk1SUiB2
aWEgcm1ycj0gZG9lc24ndCB3b3JrIChwcmVzdW1hYmx5IGJlY2F1c2Ugb2Ygbm8NCj4+IHBhdGNo
aW5nIGFjdHVhbCBkZXZpY2VzLCBidXQgdGhlcmUncyBubyB3YXJuaW5nKSwgYnV0IGl0IGZlZWxz
IGFzIGlmIGl0DQo+PiBvdWdodCB0by4NCj4+DQo+IFdoYXQgaXMgdGhlIFhlbiB2ZXJzaW9uPyBE
b2VzIGl0IGluY2x1ZGUgSmFuJ3MgY2hhbmdlIGZvciBwZXItZGV2aWNlDQo+IHF1YXJhbnRpbmU/
DQoNCkl0J3MgYW4gdXAtdG8tZGF0ZSBYZW5TZXJ2ZXIsIHNvIFhlbiA0LjEzIGJhc2VkLCBidXQg
eWVzLg0KDQo+IGJ0dyBpdCdzIHdlaXJkIHdoeSB0aG9zZSBOSUMgZGV2aWNlcyByZXF1aXJlIFJN
UlIgaW4gdGhlIGZpcnN0IHBsYWNlLi4uDQoNCkl0J3Mgc3RhdHMgdG8gdGhlIEJNQy7CoCBUaGlz
IEVtdWxleCBjYXJkIGlzIHBhcnQgb2YgdGhlIGRlZmF1bHQNCmNvbmZpZ3VyYXRpb24gb2YgdGhl
IHN5c3RlbSBmcm9tIEhQLg0KDQp+QW5kcmV3DQo=

